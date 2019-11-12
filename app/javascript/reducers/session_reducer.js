import { merge, pull } from "lodash";
import { RECEIVE_CURRENT_USER } from "../actions/session_actions";
import {
  RECEIVE_FRIENDS,
  RECEIVE_PENDING_FRIENDS,
  REMOVE_PENDING_FRIEND,
  ACCEPT_PENDING_FRIEND
} from "../actions/user_actions";

const SessionReducer = (state = { currentUser: null }, action) => {
  Object.freeze(state);
  let newState;
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      const currentUser = action.payload;
      currentUser["friendIds"] = [];
      currentUser["pendingFriendIds"] = [];
      return merge({}, state, { currentUser });
    case RECEIVE_FRIENDS:
      const friendIds = action.payload.map(friend => friend.id);
      return merge({}, state, { currentUser: { friendIds } });
    case RECEIVE_PENDING_FRIENDS:
      const pendingFriendIds = action.payload.map(
        friend => friend.requesting_friend.id
      );
      return merge({}, state, { currentUser: { pendingFriendIds } });
    case REMOVE_PENDING_FRIEND:
      newState = merge({}, state);
      pull(
        newState.currentUser.pendingFriendIds,
        action.payload.requesting_friend.id
      );
      return newState;
    case ACCEPT_PENDING_FRIEND:
      newState = merge({}, state);
      const newFriendId = action.payload.requesting_friend.id;
      pull(newState.currentUser.pendingFriendIds, newFriendId);
      newState.currentUser.friendIds.push(newFriendId);
      return newState;
    default:
      return state;
  }
};

export default SessionReducer;
