import { combineReducers } from "redux";
import ErrorsReducer from "./errors_reducer";
import EntitiesReducer from "./entities_reducer";

const RootReducer = combineReducers({
  errors: ErrorsReducer,
  entities: EntitiesReducer
});

export default RootReducer;
