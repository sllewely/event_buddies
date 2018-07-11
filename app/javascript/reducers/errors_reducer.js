import EventsErrorsReducer from "./events_errors_reducer";
import { combineReducers } from "redux";

const ErrorsReducer = combineReducers({
  events: EventsErrorsReducer
});

export default ErrorsReducer;
