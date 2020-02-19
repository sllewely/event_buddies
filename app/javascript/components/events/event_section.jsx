import React from "react";
import EventItem from "./event_item";
import 'bootstrap/dist/css/bootstrap.min.css';
import { Dropdown } from "react-bootstrap";

const EventSection = ({ date, events }) => {
  const allEvents = events.map(event => (
    <div>
      <DropDown>
        <Dropdown.Toggle id="dropdown-action-1">Action?</Dropdown.Toggle>
        <Dropdown.Menu className="super-colors">
          <Dropdown.Item eventKey="1">Action</Dropdown.Item>
          <Dropdown.Item eventKey="2">Another action</Dropdown.Item>
          <Dropdown.Item eventKey="3" active></Dropdown.Item>
        </Dropdown.Menu>
      </DropDown>
      <EventItem event={event} key={event.id} />
    </div>
  ));
  return (
    <div className="event__section V_Flex">
      <h1 className="event__date__header">{date}</h1>
      {allEvents}
    </div>
  );
};

export default EventSection;

// <DropDown>
//         <Dropdown.Toggle id="dropdown-action-1">Action?</Dropdown.Toggle>
//         <Dropdown.Menu className="super-colors">
//           <Dropdown.Item eventKey="1">Action</Dropdown.Item>
//           <Dropdown.Item eventKey="2">Another action</Dropdown.Item>
//           <Dropdown.Item eventKey="3" active></Dropdown.Item>
//         </Dropdown.Menu>
//       </DropDown>
//       <EventItem event={event} key={event.id} />
//     </div>
