import React from "react";
import { Switch } from "react-router-dom";
import Router from "./router";
import LoginForm from "./session/login_form";
import SignupForm from "./users/signup_form";
import { AuthRoute, ConRoute } from "../utils/route_utils";

// I am doing this now to be able to work on protected routes before they can be accessed,
// once they're ready comment in the bottom one and delete the top
const App = () => (
  <main>
    <Switch>
      <Router />
    </Switch>
  </main>
);

// const App = () => (
//   <main>
//     <Switch>
//       <AuthRoute exact path="/login" component={LoginForm} />
//       <AuthRoute exact path="/signup" component={SignupForm} />
//       <ConRoute
//         path="/"
//         conditional={loggedStatus => loggedStatus}
//         FalseComp={LoginForm}
//         TrueComp={Router}
//       />
//     </Switch>
//   </main>
// );

export default App;
