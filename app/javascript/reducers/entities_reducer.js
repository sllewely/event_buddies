import { combineReducers } from "redux";
import EventsReducer from "./events_reducer";
import UsersReducer from "./users_reducer";
import FriendRequestsReducer from "./friend_requests_reducer";

const EntitiesReducer = combineReducers({
  events: EventsReducer,
  users: UsersReducer,
  friendRequests: FriendRequestsReducer
});

export default EntitiesReducer;
