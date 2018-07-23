import EventsErrorsReducer from "./events_errors_reducer";
// import UsersErrorsReducer from "./users_errors_reducer";
import { combineReducers } from "redux";

const ErrorsReducer = combineReducers({
  events: EventsErrorsReducer
  // users: UsersErrorsReducer
});

export default ErrorsReducer;
