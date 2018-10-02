import { merge } from "lodash";
import { RECEIVE_EVENTS } from "../actions/event_actions";
import TEST_EVENTS from "../mock_resources/test_events";

const EventsReducer = (state = TEST_EVENTS, action) => {
  debugger;
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_EVENTS:
      let newEvents = {};
      action.payload.forEach(event => (newEvents[event.id] = event));
      debugger;
      return merge({}, state, newEvents);
    default:
      return state;
  }
};

export default EventsReducer;
