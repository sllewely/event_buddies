import React from "react";
import EventsIndex from "./events/event_index";
import { Link } from "react-router-dom";

const Header = props => {
  return (
    <div className="V_Flex header__center">
      <header className="V_Flex header">
        <i className="material-icons md-48 md-blue">event_seat</i>
        <p className="header__desc">
          This is an app. It lets you create events. Yay events
        </p>
        <Link className="header__new_event" to="/events/new">
          {" "}
          <i className="material-icons">add</i>
          <h1 className="default_text">Post a Show</h1>
        </Link>
      </header>
    </div>
  );
};

export default Header;
