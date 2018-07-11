import { merge } from "lodash";
import { RECEIVE_EVENTS } from "../actions/event_actions";

const EventsReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_EVENTS:
      return merge({}, state, action.payload.events);
    default:
      return state;
  }
};

export default EventsReducer;
