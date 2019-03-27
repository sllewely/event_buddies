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
      <div className="logout_button" onClick={this.props.logout}>
        <i className="material-icons md-48" title="logout">
          eject
        </i>
      </div>
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
