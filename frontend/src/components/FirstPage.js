import Icon from "@material-ui/core/Icon";
import { makeStyles } from "@material-ui/styles";
import Paper from "@material-ui/core/Paper";
import Container from "@material-ui/core/Container";
import Typography from "@material-ui/core/Typography";
import { Link } from "react-router-dom";
import Grid from "@material-ui/core/Grid";
import { useState } from "react";
import "fontsource-roboto";

const useStyles = makeStyles({
  root: {
    height: "80%",
    width: "80%",
  },
  paper: {
    height: 300,
    width: 300,
    padding: 20,
  },
  paper1: {
    background: "black",
  },
  container: {
    height: "100vh",
  },
  link: {
    textDecoration: "none",
  },
  typo: {
    padding: 20,
  },
});

const initShadow = 10;
const howerShadow = 2;

export default function FirstPage() {
  const classes = useStyles();
  const [shadow1, setShadow1] = useState(initShadow);
  const [shadow2, setShadow2] = useState(initShadow);
  const [shadow3, setShadow3] = useState(initShadow);

  return (
    <Container>
      <Grid
        container
        spacing={3}
        justify="center"
        alignItems="center"
        className={classes.container}
      >
        <Grid item>
          <Link to={"/login/admin"} className={classes.link}>
            <Paper
              elevation={shadow3}
              className={classes.paper}
              onMouseEnter={() => setShadow3(howerShadow)}
              onMouseLeave={() => setShadow3(initShadow)}
            >
              <Icon className={classes.root}>
                <img src="/assets/admin.svg" />
              </Icon>
              <Typography variant="h6" className={classes.typo}>
                ADMIN
              </Typography>
            </Paper>
          </Link>
        </Grid>
        <Grid item>
          <Link to={"/login/teacher"} className={classes.link}>
            <Paper
              square="false"
              elevation={shadow1}
              className={classes.paper}
              onMouseEnter={() => setShadow1(howerShadow)}
              onMouseLeave={() => setShadow1(initShadow)}
            >
              <Icon className={classes.root}>
                <img src="/assets/teacher.svg" />
              </Icon>
              <Typography variant="h6" className={classes.typo}>
                TEACHER
              </Typography>
            </Paper>
          </Link>
        </Grid>

        <Grid item>
          <Link to={"/login/student"} className={classes.link}>
            <Paper
              square="false"
              elevation={shadow2}
              className={classes.paper}
              onMouseEnter={() => setShadow2(howerShadow)}
              onMouseLeave={() => setShadow2(initShadow)}
            >
              <Icon className={classes.root}>
                <img src="/assets/student.svg" />
              </Icon>
              <Typography variant="h6" className={classes.typo}>
                STUDENT
              </Typography>
            </Paper>
          </Link>
        </Grid>
      </Grid>
    </Container>
  );
}
