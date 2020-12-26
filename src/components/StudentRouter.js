import React, { useState, useEffect } from "react";
import {
  Switch,
  Route,
  BrowserRouter,
  useHistory,
  withRouter,
  Redirect,
} from "react-router-dom";
import Home from "./Home";
import DepartmentPost from "./DepartmentPost";
import Header from "./Header";
import ClassPost from "./ClassPost";
import axios from "axios";
import Placement from "./Placement";
import CreatePlacement from "./CreatePlacement";
import Nav from "./Nav";
import { makeStyles, BottomNavigation } from "@material-ui/core";
import Footer from "./Footer";

const useStyles = makeStyles((theme) => ({
  root: {
    display: "flex",
  },
  content: {
    flexGrow: 1,
    padding: theme.spacing(4),
    margin: "20px",
    padding: "20px",
  },
}));

function StudentRouter() {
  const history = useHistory();

  const [user, setUser] = useState();
  useEffect(() => {
    axios
      .get("/getUser")
      .then((result) => {
        setUser(result.data);
        console.log(user);
      })
      .catch((err) => {
        if (err.response && err.response.status === 400) {
          alert("You are not logged In");
          history.push("/");
        } else alert("There is something wrong with the server");
      });
  });

  const classes = useStyles();

  if (!user) {
    return <Redirect to="/home/student/" />;
  }

  return (
    <div className={classes.root}>
      <Header />
      <Nav />
      <main className={classes.content}>
        <Switch>
          <Route path="/home/student/" exact component={Home} />
          <Route
            path="/home/student/department"
            exact
            render={(props) => <DepartmentPost {...props} user={user} />}
          />
          <Route path="/home/student/class" exact component={ClassPost} />
          <Route path="/home/student/placement" exact component={Placement} />
          <Route
            path="/home/student/creation"
            exact
            component={CreatePlacement}
          />
        </Switch>
      </main>
    </div>
  );
}

export default withRouter(StudentRouter);
