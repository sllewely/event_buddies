import React from "react";
import { Switch } from "react-router-dom";
import Router from "./router";
import LoginForm from "./session/login_form";
import SignupForm from "./users/signup_form";
import Home from "./home";
import { AuthRoute, ConRoute } from "../utils/route_utils";

const App = () => (
  <main>
    <Switch>
      <AuthRoute exact path="/login" component={LoginForm} />
      <AuthRoute exact path="/signup" component={SignupForm} />
      <ConRoute
        path="/"
        conditional={loggedStatus => loggedStatus}
        FalseComp={Home}
        TrueComp={Router}
      />
    </Switch>
  </main>
);

export default App;
