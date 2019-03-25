import { merge } from "lodash";
import { RECEIVE_USERS } from "../actions/user_actions";
import { RECEIVE_CURRENT_USER } from "../actions/session_actions";

const UsersReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_USERS:
      return merge({}, state, action.payload.users);
    case RECEIVE_CURRENT_USER:
      return merge({}, state, action.payload.user);
    default:
      return state;
  }
};

export default UsersReducer;
