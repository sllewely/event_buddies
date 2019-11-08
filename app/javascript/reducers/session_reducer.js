import { merge } from "lodash";
import { RECEIVE_CURRENT_USER } from "../actions/session_actions";

const SessionReducer = (state = { currentUser: null }, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      const currentUser = action.payload;
      currentUser["friend_ids"] = [];
      return merge({}, state, { currentUser });
    case RECEIVE_FRIENDS:
      const friend_ids = action.payload.map(friend => friend["id"]);
      return merge({}, state, { currentUser: { friend_ids } });
    default:
      return state;
  }
};

export default SessionReducer;
