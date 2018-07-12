import React from "react";
import { connect } from "react-redux";
import EventItem from "./event_item";

const EventsIndex = ({ events }) => {
  const allEvents = events.map(event => (
    <EventItem event={event} key={event.id} />
  ));
  return { allEvents };
};

const msp = state => {
  return {
    events: Object.values(state.entities.events)
  };
};

export default connect(msp, null)(EventsIndex);
