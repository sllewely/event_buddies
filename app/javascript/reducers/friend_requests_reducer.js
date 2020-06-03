import { merge } from "lodash";
import {
  RECEIVE_PENDING_FRIENDS,
  REMOVE_PENDING_FRIEND,
  ACCEPT_PENDING_FRIEND
} from "../actions/user_actions";

const FriendRequestReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_PENDING_FRIENDS:
      let friendRequestIds = {};
      action.payload.forEach(friendRequest => {
        friendRequestIds[friendRequest.requesting_friend.id] = friendRequest.id;
      });
      return merge({}, state, friendRequestIds);
    case REMOVE_PENDING_FRIEND:
    case ACCEPT_PENDING_FRIEND:
      let newState = merge({}, state);
      delete newState[action.payload.requesting_friend.id];
      return newState;
    default:
      return state;
  }
};

export default FriendRequestReducer;
