import { merge } from "lodash";
import { RECEIVE_CURRENT_SUER } from "../actions/session_actions";
import TEST_USERS from "../mock_resources/test_users";

const UsersReducer = (state = TEST_USERS, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return merge({}, state, { currentUser: action.payload });
    default:
      return state;
  }
};

export default UsersReducer;
