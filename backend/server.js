const express = require("express");
const app = express();
const department = require("./routes/department");
const auth = require("./routes/auth");
const placement = require("./routes/placement");
const course = require("./routes/course");
const user = require("./routes/user");
const student = require("./routes/student");
const teacher = require("./routes/teacher");
var cors = require("cors");
require('./startup/prod')(app);

const listeningPort = 1500;

app.use(cors());

app.get("/", (req, res) => {
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader("Access-Control-Allow-Credentials", "true");
  res.setHeader("Access-Control-Max-Age", "1800");
  res.setHeader("Access-Control-Allow-Headers", "content-type");
  res.setHeader(
    "Access-Control-Allow-Methods",
    "PUT, POST, GET, DELETE, PATCH, OPTIONS"
  );
});

app.use(express.json());
app.use("/api/getUser", user);
app.use("/api/department", department);
app.use("/api/student", student);
app.use("/api/teacher", teacher);
app.use("/api/auth", auth);
app.use("/api/course", course);
app.use("/api/placement", placement);

app.listen(listeningPort);
