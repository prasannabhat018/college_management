const mysql = require("mysql")
const dotenv = require("dotenv").config();

var host = process.env.MYSQL_HOST;
var user = process.env.MYSQL_USER;
var password = process.env.MYSQL_PASSWORD;
var database = process.env.MYSQL_DB;


let mysqlDB = null; // db handler
let connected = null; // default null / boolean
let connectFreq = 1000; // When database is disconnected, how often to attempt reconnect? Miliseconds
let testFreq = 10000;

function attemptMySQLConnection(callback) {
    // console.log(process.env.MYSQL_HOST);
    if (host && user && database) {
  
      mysqlDB = mysql.createPool({
        host: host,
        user: user,
        password: password,
        database: database,
        connectionLimit: 300,
        waitForConnections: true, // Default value.
        queueLimit: 300, // Unlimited
        acquireTimeout: 60000,
        timeout: 60000,
        debug: false
      });
  
      testConnection((result) => {
        callback(result)
      })
  
    } else {
    //   console.error('Check env variables: MYSQL_HOST, MYSQL_USER & MYSQL_DB')
      callback(false)
    }
  }
  
  function testConnection(cb) {
    // console.log('testConnection')
    mysqlDB.query('SELECT 1 + 1 AS solution', (error, results, fields) => {
      try {
        if (error) {
          throw new Error('No DB Connection');
        } else {
          if (results[0].solution) {
            cb(true)
          } else {
            cb(false)
          }
        }
      } catch (e) {
        // console.error(e.name + ': ' + e.message);
        cb(false)
      }
    });
  }
  
  function callbackCheckLogic(res) {
    if (res) {
    //   console.log('Connect was good. Scheduling next test for ', testFreq, 'ms')
      setTimeout(testConnectionCB, testFreq);
    } else {
    //   console.log('Connection was bad. Scheduling connection attempt for ', connectFreq, 'ms')
      setTimeout(connectMySQL, connectFreq);
    }
  }
  
  function testConnectionCB() {
    testConnection((result) => {
      callbackCheckLogic(result);
    })
  }
  
  function connectMySQL() {
    attemptMySQLConnection(result => {
      callbackCheckLogic(result);
    });
  }
  
  connectMySQL(); // Start the process by calling this once
  
  module.exports = mysqlDB;