import React from "react";
import EventItem from "./event_item";

const EventSection = ({ date, events }) => {
  const allEvents = events.map(event => (
    <EventItem event={event} key={event.id} />
  ));
  return (
    <div className="event__section V_Flex">
      <h1 className="event__date__header">{date}</h1>
      {allEvents}
    </div>
  );
};

export default EventSection;
