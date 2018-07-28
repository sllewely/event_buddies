import React from "react";
import { connect } from "react-redux";
import { withRouter } from "react-router-dom";
import { merge } from "lodash";
import { postEvent } from "../../actions/event_actions";

class EventForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: this.props.event.name,
      location: this.props.event.location,
      description: this.props.event.description,
      tickets: this.props.event.tickets,
      date: this.props.event.date,
      time: this.props.event.time
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
        {this.props.errors.map((error, idx) => <li key={idx}>{error}</li>)}
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
            onChange={this.update("ticket")}
            value={this.state.ticket}
          />
        </section>
        <section>
          Date:
          <input
            type="date"
            className="event__form_field"
            onChange={this.update("date")}
            value={this.state.date}
          />
        </section>
        <section>
          Time:
          <input
            type="time"
            className="event__form_field"
            onChange={this.update("time")}
            value={this.state.time}
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
  const defaultEvent = { name: "", location: "", tickets: "", description: "" };
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

export default connect(msp, mdp)(EventForm);
