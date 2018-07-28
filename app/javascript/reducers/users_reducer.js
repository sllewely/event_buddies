import { merge } from "lodash";
import { RECEIVE_EVENTS } from "../actions/event_actions";
import TEST_USERS from "../mock_resources/test_users";

const UsersReducer = (state = TEST_USERS, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_EVENTS:
      return merge({}, state, action.payload.users);
    default:
      return state;
  }
};

export default UsersReducer;
