import React from "react";
import NewEventButton from "./utilities/new_event_button";

const EventEnd = props => {
  return (
    <div className="H_Flex">
      <h2>That's all, folks!</h2>
      <NewEventButton />
    </div>
  );
};

export default EventEnd;
