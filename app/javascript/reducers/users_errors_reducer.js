import { RECEIVE_USERS, RECEIVE_USER_ERRORS } from "../actions/user_actions";

const UsersErrorsReducer = (state = [], action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_USER_ERRORS:
      return action.errors
        ? action.errors.responseJSON
        : ["something went wrong, please try again"];
    case RECEIVE_USERS:
      return [];
    default:
      return state;
  }
};

export default UsersErrorsReducer;
