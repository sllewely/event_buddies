import { RECEIVE_SESSION_ERRORS } from "../actions/session_actions";

const EventsErrorsReducer = (state = [], action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_SESSION_ERRORS:
      return action.errors
        ? action.errors.responseJSON
        : ["something went wrong, please try again"];
    case RECEIVE_CURRENT_USER:
      return [];
    default:
      return state;
  }
};

export default SessionErrorsReducer;
