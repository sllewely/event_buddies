import React from "react";
import EventsIndex from "./events/event_index";
import { Link } from "react-router-dom";

const Home = props => {
  return (
    <div className="V_Flex home__center">
      <header className="V_Flex home">
        <i className="material-icons md-48 md-blue">event_seat</i>
        <p className="home__desc">
          This is an app. It lets you create events. Yay events
        </p>
        <Link className="home__new_event" to="/events/new">
          {" "}
          <i className="material-icons">add</i>
          <h1 className="default_text">Post a Show</h1>
        </Link>
      </header>
      <EventsIndex />
    </div>
  );
};

export default Home;
