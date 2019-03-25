import React from "react";
import { Route, redirect, Switch, Link, HashRouter } from "react-router-dom";
import EventForm from "./events/event_form";
import EventIndex from "./events/event_index";
import Header from "./header";

const Router = () => (
  <main>
    <Header />
    <Switch>
      <Route exact path="/events/new" component={EventForm} />
      <Route path="/" component={EventIndex} />
    </Switch>
  </main>
);

export default Router;
