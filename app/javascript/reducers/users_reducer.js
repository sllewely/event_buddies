import { merge } from "lodash";
import {
  RECEIVE_USERS,
  RECEIVE_FRIENDS,
  RECEIVE_PENDING_FRIENDS
} from "../actions/user_actions";
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
    case RECEIVE_PENDING_FRIENDS:
      let pendingFriends = {};
      action.payload.forEach(friendRequest => {
        pendingFriends[friendRequest.requesting_friend.id] =
          friendRequest.requesting_friend;
      });
      return merge({}, state, pendingFriends);
    case RECEIVE_CURRENT_USER:
      let user = action.payload.receivedUser
      return merge({}, state, {[user.id]: user});
    default:
      return state;
  }
};

export default UsersReducer;
