import React from "react";
import { connect } from "react-redux";
import { withRouter } from "react-router-dom";
import { merge } from "lodash";
import { postEvent } from "../../actions/event_actions";
import Datetime from "react-datetime";
import * as moment from "moment";

class EventForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: this.props.event.name,
      location: this.props.event.location,
      description: this.props.event.description,
      event_link: this.props.event.event_link,
      date_time: this.props.event.date_time
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    const event = merge({}, this.state);
    this.props
      .submitAction(event)
      .then(
        () => this.props.history.push(`/`),
        () => console.log("will robinson")
      );
  }

  update(field) {
    return e => this.setState({ [field]: e.currentTarget.value });
  }

  render() {
    return (
      <form className="event__form" onSubmit={e => this.handleSubmit(e)}>
        {this.props.errors.map((error, idx) => (
          <li key={idx}>{error}</li>
        ))}
        <header>
          Event Name:
          <input
            type="text"
            className="event__form_field"
            onChange={this.update("name")}
            value={this.state.name}
          />
        </header>
        <section>
          Location:
          <input
            type="text"
            className="event__form_field"
            onChange={this.update("location")}
            value={this.state.location}
          />
        </section>
        <section>
          Description:
          <textarea
            type="text"
            className="event__form_field"
            onChange={this.update("description")}
            value={this.state.description}
          />
        </section>
        <section>
          Ticket Link:
          <input
            type="text"
            className="event__form_field"
            onChange={this.update("event_link")}
            value={this.state.ticket}
          />
        </section>
        <section>
          Date:
          <Datetime
            className="event__form_field"
            onChange={date_time => this.setState({ date_time })}
            value={this.state.date_time}
          />
        </section>
        <footer>
          <input
            className="event__form_submit"
            type="submit"
            value="Create Event"
          />
        </footer>
      </form>
    );
  }
}

const msp = (state, ownProps) => {
  const defaultEvent = {
    name: "",
    location: "",
    event_link: "",
    description: "",
    date_time: moment()
      .hour(19)
      .add(7, "d")
  };
  return {
    event: defaultEvent,
    errors: state.errors.events
  };
};

const mdp = dispatch => {
  return {
    submitAction: event => dispatch(postEvent(event))
  };
};

export default connect(
  msp,
  mdp
)(EventForm);
