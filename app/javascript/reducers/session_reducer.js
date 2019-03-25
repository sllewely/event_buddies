import { merge } from "lodash";
import { RECEIVE_CURRENT_USER } from "../actions/session_actions";

const UsersReducer = (state = [], action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return merge({}, state, { currentUser: action.payload });
    default:
      return state;
  }
};

export default UsersReducer;
