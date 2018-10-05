import React from "react";
import { connect } from "react-redux";
import EventItem from "./event_item";
import { fetchEvents } from "../../actions/event_actions.js";
import * as moment from "moment";

class EventsIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchEvents();
  }

  render() {
    const allEvents = this.props.events.map(event => (
      <EventItem event={event} key={event.id} />
    ));
    return allEvents;
  }
}

const msp = state => {
  return {
    events: Object.values(state.entities.events).sort((a, b) =>
      a.date_time.diff(b.date_time)
    )
  };
};

const mdp = dispatch => {
  return {
    fetchEvents: () => dispatch(fetchEvents())
  };
};

export default connect(
  msp,
  mdp
)(EventsIndex);
