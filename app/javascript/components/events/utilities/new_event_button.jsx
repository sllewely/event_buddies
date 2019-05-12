import React from "react";
import { Link } from "react-router-dom";

const NewEventButton = props => {
  return (
    <Link className="header__new_event" to="/events/new">
      <h1 className="default_text">Post a Show</h1>
      <i className="material-icons">add</i>
    </Link>
  );
};

export default NewEventButton;
