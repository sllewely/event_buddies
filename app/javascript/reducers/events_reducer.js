import { merge } from "lodash";
import { RECEIVE_EVENTS } from "../actions/event_actions";

const EventsReducer = (
  state = {
    123: {
      id: 123,
      name: "concert",
      date: "456",
      tickets: "http://www.google.com",
      location: "here",
      description: "people playing"
    },
    124: {
      id: 124,
      name: "birthday",
      date: "789",
      tickets: "http://www.example.com",
      location: "somehwre else",
      description: "cake and shit"
    }
  },
  action
) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_EVENTS:
      return merge({}, state, action.payload.events);
    default:
      return state;
  }
};

export default EventsReducer;
