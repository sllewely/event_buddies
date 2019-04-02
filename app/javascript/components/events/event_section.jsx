import React from "react";
import EventItem from "./event_item";

const EventSection = ({ date, events }) => {
  const allEvents = events.map(event => (
    <EventItem event={event} key={event.id} />
  ));
  debugger;
  return (
    <div>
      <h1>{date}</h1>
      {allEvents}
    </div>
  );
};

export default EventSection;
