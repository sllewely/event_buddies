import React from "react";
import { connect } from "react-redux";
import { withRouter } from "react-router-dom";
import { merge } from "lodash";

class EventForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: this.props.event.rating,
      location: this.props.event.location,
      description: this.props.event.description,
      tickets: this.props.event.tickets
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    const event = merge({}, this.state);
    this.props.submitAction(event).then(() => this.props.history.push(`/`));
  }

  update(field) {
    return e => this.setState({ [field]: e.currentTarget.value });
  }

  render() {
    return (
      <form onSubmit={e => this.handleSubmit(e)}>
        {this.props.errors.map((error, idx) => <li key={idx}>{error}</li>)}
        <header>
          Event Name:
          <input
            type="text"
            onChange={this.update(name)}
            value={this.state.name}
          />
        </header>
      </form>
    );
  }
}
