import React from "react";
import { Provider } from "react-redux";
import { HashRouter } from "react-router-dom";
import { connect } from "react-redux";
import { setJwtToken } from "../actions/session_actions.js";

import App from "./app";

class Root extends React.Component {
  constructor(props) {
    super(props);
    this.componentCleanup = this.componentCleanup.bind(this);
  }

  componentDidMount() {
    window.addEventListener("beforeunload", this.componentCleanup);
    window.jwt = JSON.parse(sessionStorage.getItem("jwt"));
    this.props.setJwtToken(window.jwt);
  }

  componentWillUnmount() {
    this.componentCleanup();
    window.removeEventListener("beforeunload", this.componentCleanup);
  }

  componentCleanup() {
    sessionStorage.setItem("jwt", JSON.stringify(window.jwt));
  }

  render() {
    return (
      <Provider store={this.props.store}>
        <HashRouter>
          <App />
        </HashRouter>
      </Provider>
    );
  }
}

const mdp = dispatch => {
  return {
    setJwtToken: token => dispatch(setJwtToken(token))
  };
};

export default connect(
  null,
  mdp
)(Root);
