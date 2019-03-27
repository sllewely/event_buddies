import React from "react";
import EventsIndex from "./events/event_index";
import { Link } from "react-router-dom";
import LogoutButton from "./session/logout_button";

const Header = props => {
  return (
    <div className="V_Flex header__center">
      <header className="V_Flex header">
        <div className="H_Flex_header">
          <div className="header__left">
            <Link to="/" className="header__left">
              <i className="material-icons md-48 md-blue">event_seat</i>
              <h2 className="header__title">Concert Buddies</h2>
            </Link>
          </div>
          <div className="header__right">
            <Link to="/friends">
              <i className="material-icons md-48" title="Friends">
                people
              </i>
            </Link>
            <Link to="/settings">
              <i className="material-icons md-48" title="Settings">
                settings
              </i>
            </Link>
            <LogoutButton />
          </div>
        </div>
        <div className="border_line" />
        <Link className="header__new_event" to="/events/new">
          {" "}
          <h1 className="default_text">Post a Show</h1>
          <i className="material-icons">add</i>
        </Link>
      </header>
    </div>
  );
};

export default Header;
