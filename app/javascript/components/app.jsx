import React from "react";
import { Route, redirect, Switch, Link, HashRouter } from "react-router-dom";
import EventForm from "./events/event_form";
import EventsIndex from "./events/event_index";

const App = () => (
  <div>
    <Switch>
      <Route exact path="/events/new" component={EventForm} />
      <Route path="/" component={EventsIndex} />
    </Switch>
  </div>
);

export default App;
