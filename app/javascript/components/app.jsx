import React from "react";
import { Switch } from "react-router-dom";
import Router from "./router";
import LoginForm from "./session/login_form";
import SignupForm from "./users/signup_form";
import { AuthRoute, ConRoute } from "../utils/route_utils";

const App = () => (
  <main>
      <link href="https://fonts.googleapis.com/css?family=Cutive|Oleo+Script|Oleo+Script+Swash+Caps&display=swap" rel="stylesheet"/>
      <Switch>
      <AuthRoute exact path="/login" component={LoginForm} />
      <AuthRoute exact path="/signup" component={SignupForm} />
      <ConRoute
        path="/"
        conditional={loggedStatus => loggedStatus}
        FalseComp={LoginForm}
        TrueComp={Router}
      />
    </Switch>
  </main>
);

export default App;
