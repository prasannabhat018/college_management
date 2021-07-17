import React, { useState, useEffect } from "react";
import Post from "./Post";
import axios from "axios";
import { useHistory, Redirect } from "react-router-dom";
import Grid from "@material-ui/core/Grid";
import { makeStyles } from "@material-ui/styles";
import { Container, Typography } from "@material-ui/core";
import { trackPromise } from "react-promise-tracker";

const useStyles = makeStyles({
  typo: {
    margin: "10px",
    padding: "20px",
    color: "#523e02",
  },
});

export default function DepartmentPost({ user }) {
  const [posts, setPosts] = useState([]);
  const history = useHistory();
  const classes = useStyles();

  useEffect(() => {
    trackPromise(
      axios
        .get("/department/post", {
          headers: { "x-auth-token": localStorage["x-auth-token"] },
        })
        .then((result) => {
          setPosts(result.data);
        })
        .catch((err) => {
          if (err.response && err.response.status === 400) {
            history.push("/");
          } else {
            console.log(err);
            alert("Sorry!! There is something wrong with the Server");
          }
        })
    );
  }, []);

  const feed = posts.map((post) => (
    <Grid item xs={12} justify="center">
      <Post 
      key={post.p_id} 
      title={post.title} 
      message={post.message} 
      date={post.date}
    />
    </Grid>
  ));
  if (!user) {
    return <Redirect to="/home/student" />;
  }
  return (
    <Container>
      <Typography variant="h4" align="left" className={classes.typo}>
        {user.d_name} Notice Board
      </Typography>

      <Grid
        container
        justify="center"
        alignItems="center"
        className={classes.root}
      >
        {feed}
      </Grid>
    </Container>
  );
}
