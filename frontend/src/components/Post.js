import React from "react";
import Paper from "@material-ui/core/Paper";
import Typography from "@material-ui/core/Typography";
import { makeStyles } from "@material-ui/styles";
import TimeAgo from 'react-timeago'
import frenchStrings from 'react-timeago/lib/language-strings/fr'
import buildFormatter from 'react-timeago/lib/formatters/buildFormatter'


const useStyles = makeStyles({
  root: {
    width: "80%",
    padding: "20px",
    margin: "20px",
    borderColor: "#2e2e2e",
  },
  upper: {
    color: "#d4b168",
  },
});


export default function Post(props) {
  const classes = useStyles();
  var text = "";
  const author = props.author;
  const date = props.date;
  if (author) {
    text = "- posted by " + author;
  }
  var upper;
  if (props.course) {
    upper = (
      <Typography variant="h6" align="left" className={classes.upper}>
        {props.course}
      </Typography>
    );
  } else {
    upper = <div></div>;
  }
  return (
    <Paper elevation={5} className={classes.root}>
      <Typography align="left" variant="h5">
        {props.title}
      </Typography>
      {upper}
      <Typography variant="subtitle1" color="textSecondary" align="left">
        {text}
      </Typography>
      <Typography variant="subtitle2" color="textSecondary" align="left">
          <TimeAgo date={date}/>
        </Typography>
      {props.year && (
        <Typography variant="subtitle2" color="textSecondary" align="left">
          Year - {props.year}
        </Typography>
      )}
      <br />
      <Typography align="justify" variant="body1">
        {props.message}
      </Typography>
    </Paper>
  );
}
