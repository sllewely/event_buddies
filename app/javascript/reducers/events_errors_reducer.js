import { RECEIVE_EVENTS, RECEIVE_EVENT_ERRORS } from "../actions/event_actions";

const EventsErrorsReducer = (state = [], action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_EVENT_ERRORS:
      return action.errors.responseJSON;
    case RECEIVE_EVENTS:
      return [];
    default:
      return state;
  }
};

export default EventsErrorsReducer;
