import React from "react";
import { merge } from "lodash";
import { signup } from "../../actions/session_actions";
import { connect } from "react-redux";
import { Link, withRouter } from "react-router-dom";

class SignupForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      email: "",
      password: "",
      passwordMatch: "",
      errors: null
    };
  }

  update(type) {
    return e => this.setState({ [type]: e.currentTarget.value });
  }

  clearPasswordMismatchError() {
    return e => this.setState({ errors: null });
  }

  handleSubmit(e) {
    e.preventDefault();
    if (this.state.password === this.state.passwordMatch) {
      const user = {
        user: {
          email: this.state.email,
          password: this.state.password
        }
      };
      this.props
        .signup(user)
        .then(
          () => this.props.history.push(`/`),
          () => this.setState({ password: "", passwordMatch: "" })
        );
    } else {
      this.setState({
        password: "",
        passwordMatch: "",
        errors: "Your passwords did not match"
      });
    }
  }

  render() {
    const errors = this.state.errors ? <h3>{this.state.errors}</h3> : null;
    return (
      <div className="auth-form-container">
        <h1 className="auth-form-title">Concert Buddies</h1>
        <form className="auth-form" onSubmit={e => this.handleSubmit(e)}>
          <h2>Sign Up</h2>
          {this.props.errors.map((error, idx) => (
            <li className="auth-form-error" key={idx}>
              {error}
            </li>
          ))}
          {errors}
          <input
            className="auth-field"
            type="text"
            onChange={this.update("email")}
            placeholder="Email"
            value={this.state.email}
          />
          <input
            className="auth-field"
            type="password"
            onChange={this.update("password")}
            onBlur={this.clearPasswordMismatchError()}
            placeholder="Password"
            value={this.state.password}
          />
          <input
            className="auth-field"
            type="password"
            onChange={this.update("passwordMatch")}
            placeholder="Confirm Password"
            value={this.state.passwordMatch}
          />

          <input className="auth-submit" type="submit" value="Sign Up" />
        </form>
        <Link to="/login" className="auth-swap">
          Already have an account? Log in
        </Link>
      </div>
    );
  }
}

const msp = state => {
  return {
    errors: state.errors.session
  };
};

const mdp = dispatch => {
  return {
    signup: user => dispatch(signup(user))
  };
};

export default withRouter(
  connect(
    msp,
    mdp
  )(SignupForm)
);
