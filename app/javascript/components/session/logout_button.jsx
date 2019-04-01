import React from "react";
import { connect } from "react-redux";
import { logout } from "../../actions/session_actions.js";

// TODO:Switch to functional component
class LogoutButton extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <h1 className="logout_button" onClick={this.props.logout}>
        logout
      </h1>
    );
  }
}

const mdp = dispatch => {
  return {
    logout: () => dispatch(logout())
  };
};

export default connect(
  null,
  mdp
)(LogoutButton);
