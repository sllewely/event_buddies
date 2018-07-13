import React from "react";
import { Route, redirect, Switch, Link, HashRouter } from "react-router-dom";
import EventForm from "./events/event_form";
import Home from "./home";

const App = () => (
  <main>
    <Switch>
      <Route exact path="/events/new" component={EventForm} />
      <Route path="/" component={Home} />
    </Switch>
  </main>
);

export default App;
