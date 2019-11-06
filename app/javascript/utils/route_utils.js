import React from "react";
import { connect } from "react-redux";
import { Route, Redirect, withRouter } from "react-router-dom";

const Auth = ({ component: Component, path, loggedIn, exact }) => (
  <Route
    path={path}
    exact={exact}
    render={props => {
      return !loggedIn ? <Component {...props} /> : <Redirect to="/" />;
    }}
  />
);

const Protected = ({ component: Component, path, loggedIn, exact }) => (
  <Route
    path={path}
    exact={exact}
    render={props =>
      loggedIn ? <Component {...props} /> : <Redirect to="/login" />
    }
  />
);

const Con = ({ loggedIn, TrueComp, FalseComp, path, exact, conditional }) => (
  <Route
    path={path}
    exact={exact}
    render={props =>
      conditional(loggedIn) ? <TrueComp {...props} /> : <FalseComp {...props} />
    }
  />
);

const mapStateToProps = state => {
  return { loggedIn: Boolean(state.session.jwtToken) };
};

export const AuthRoute = withRouter(connect(mapStateToProps)(Auth));
export const ConRoute = withRouter(connect(mapStateToProps)(Con));
export const ProtectedRoute = withRouter(connect(mapStateToProps)(Protected));
