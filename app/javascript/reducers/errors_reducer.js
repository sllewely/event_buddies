import EventsErrorsReducer from "./events_errors_reducer";
import SessionErrorsReducer from "./session_errors_reducer";
import UsersErrorsReducer from "./users_errors_reducer";
import { combineReducers } from "redux";

const ErrorsReducer = combineReducers({
  events: EventsErrorsReducer,
  session: SessionErrorsReducer,
  users: UsersErrorsReducer
});

export default ErrorsReducer;
