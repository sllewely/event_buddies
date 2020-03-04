import { merge } from "lodash";
import { RECEIVE_CURRENT_USER } from "../actions/session_actions";
import { RECEIVE_JWT_TOKEN } from "../actions/session_actions";
import {
  RECEIVE_FRIENDS,
  RECEIVE_PENDING_FRIENDS
} from "../actions/user_actions";

const SessionReducer = (state = { currentUser: null }, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      const currentUser = action.payload.receivedUser;
      currentUser["friendIds"] = [];
      currentUser["pendingFriendIds"] = [];
      return merge({}, state, {
        currentUser,
        jwtToken: action.payload.token
      });
    case RECEIVE_JWT_TOKEN:
      return merge({}, state, {
        jwtToken: action.payload
      });
    case RECEIVE_FRIENDS:
      const friendIds = action.payload.map(friend => friend["id"]);
      return merge({}, state, { currentUser: { friendIds } });
    case RECEIVE_PENDING_FRIENDS:
      const pendingFriendIds = action.payload.map(
        friendRequest => friendRequest.requesting_friend.id
      );
      return merge({}, state, { currentUser: { pendingFriendIds } });
    default:
      return state;
  }
};

export default SessionReducer;
