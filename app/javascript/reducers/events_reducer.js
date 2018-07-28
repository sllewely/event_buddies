import { merge } from "lodash";
import { RECEIVE_EVENTS } from "../actions/event_actions";
import TEST_EVENTS from "../mock_resources/test_events";

const EventsReducer = (state = TEST_EVENTS, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_EVENTS:
      return merge({}, state, action.payload.events);
    default:
      return state;
  }
};

export default EventsReducer;
