import { merge } from "lodash";
import { RECEIVE_USERS, RECEIVE_FRIENDS } from "../actions/user_actions";
import { RECEIVE_CURRENT_USER } from "../actions/session_actions";

const UsersReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_USERS:
      return merge({}, state, action.payload.users);
    case RECEIVE_FRIENDS:
      let newFriends = {};
      action.payload.forEach(friend => {
        newFriends[friend.id] = friend;
      });
      return merge({}, state, newFriends);
    case RECEIVE_CURRENT_USER:
      return merge({}, state, action.payload);
    default:
      return state;
  }
};

export default UsersReducer;
