import { merge } from "lodash";
import { RECEIVE_EVENTS } from "../actions/event_actions";
import TEST_EVENTS from "../mock_resources/test_events";
import * as moment from "moment";

const EventsReducer = (state = TEST_EVENTS, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_EVENTS:
      let newEvents = {};
      action.payload.forEach(event => {
        event.date_time = moment(event.date_time);
        newEvents[event.id] = event;
      });
      return merge({}, state, newEvents);
    default:
      return state;
  }
};

export default EventsReducer;
