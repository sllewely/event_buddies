import * as UserUtils from "../utils/user_api_utils";

// export const RECEIVE_USER = 'RECEIVE_USER';
export const RECEIVE_USER_ERRORS = "RECEIVE_USER_ERRORS";
export const RECEIVE_USERS = "RECEIVE_USERS";

const receiveUsers = payload => ({
  type: RECEIVE_USERS,
  payload
});

const receiveUserErrors = payload => ({
  type: RECEIVE_USER_ERRORS,
  payload
});

export const fetchUser = id => dispatch =>
  UserUtils.fetchUser(id).then(
    receivedUser => dispatch(receiveUsers(receivedUser)),
    err => dispatch(receiveUserErrors(err))
  );

export const fetchUsers = () => dispatch =>
  UserUtils.fetchUsers().then(
    receivedUsers => dispatch(receiveUsers(receiveUsers)),
    err => dispatch(receiveUserErrors(err))
  );

export const createUser = user => dispatch =>
  UserUtils.createUser(user).then(
    receivedUser => dispatch(receiveUsers(receivedUser)),
    err => {
      dispatch(receiveUserErrors(err));
      throw new Error("Create User Error");
    }
  );
