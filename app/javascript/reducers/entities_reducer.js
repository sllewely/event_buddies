import { combineReducers } from "redux";
import EventsReducer from "./events_reducer";
import UsersReducer from "./users_reducer";

const EntitiesReducer = combineReducers({
  events: EventsReducer,
  users: UsersReducer
});

export default EntitiesReducer;
