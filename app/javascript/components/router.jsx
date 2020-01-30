import React from "react";
import { Route, redirect, Switch, Link, HashRouter } from "react-router-dom";
import FriendsPage from "./friends/friends_page";
import SettingsPage from "./settings/settings_page";
import EventForm from "./events/event_form";
import EventIndex from "./events/event_index";
import Header from "./header";

const Router = () => (
  <main>
    <Header />
    <Switch>
      <Route exact path="/friends" component={FriendsPage} />
      <Route exact path="/settings" component={SettingsPage} />
      <Route exact path="/events/new" component={EventForm} />
      <Route path="/" component={EventIndex} />
    </Switch>
  </main>
);

export default Router;
