import React from "react";
import { Route, redirect, Switch, Link, HashRouter } from "react-router-dom";
import EventNew from "./events/event_new";
import EventsIndex from "./events/event_index";

const App = () => (
  <div>
    <Switch>
      <Route exact path="/events/new" component={EventNew} />
      <Route path="/" component={EventsIndex} />
    </Switch>
  </div>
);

export default App;
