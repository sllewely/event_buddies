import * as SessionUtils from "../utils/session_api_utils";
import * as UserUtils from "../utils/user_api_utils";

export const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS";
export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";

const receiveCurrentUser = payload => ({
  type: RECEIVE_CURRENT_USER,
  payload
});

const receiveSessionErrors = payload => ({
  type: RECEIVE_SESSION_ERRORS,
  payload
});

export const login = user => dispatch =>
  SessionUtils.login(user).then(
    receivedUser => dispatch(receiveCurrentUser(receivedUser)),
    err => {
      dispatch(receiveSessionErrors(err));
      throw new Error("Session Login Error");
    }
  );

export const signup = user => dispatch =>
  UserUtils.createUser(user).then(
    () => dispatch(login(user)),
    err => {
      dispatch(receiveSessionErrors(err));
      throw new Error("Create User Error");
    }
  );

export const logout = () => dispatch =>
  SessionUtils.logout().then(
    () => dispatch(receiveCurrentUser(null)),
    err => {
      dispatch(receiveSessionErrors(err));
      throw new Error("Session Logout Error");
    }
  );
