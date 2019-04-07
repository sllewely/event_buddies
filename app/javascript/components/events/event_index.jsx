import React from "react";
import { connect } from "react-redux";
import EventItem from "./event_item";
import { fetchEvents } from "../../actions/event_actions.js";
import { merge } from "lodash";
import EventSection from "./event_section";
import * as moment from "moment";

class EventsIndex extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  componentDidMount() {
    this.props.fetchEvents();
  }

  // TODO: find all dates of events

  findAllDates() {
    let eventsByDate = {};
    this.props.events.forEach(event => {
      eventsByDate = merge(eventsByDate, {
        [event.date_time.format("dddd, MMMM Do YYYY")]: { [event.id]: event }
      });
    });
    return eventsByDate;
  }

  render() {
    const eventsByDate = this.findAllDates();
    const dates = Object.keys(eventsByDate);
    const dateEventsTuple = dates.map(date => {
      return [date, Object.values(eventsByDate[date])];
    });

    const allEvents = dateEventsTuple.map(tuple => (
      <EventSection date={tuple[0]} events={tuple[1]} />
    ));
    // const allEvents = this.props.events.map(event => (
    //   <EventItem event={event} key={event.id} />
    // ));
    return <div className="V_Flex">{allEvents}</div>;
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
