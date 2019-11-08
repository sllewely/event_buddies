import * as UserUtils from "../utils/user_api_utils";

export const RECEIVE_USER_ERRORS = "RECEIVE_USER_ERRORS";
export const RECEIVE_USERS = "RECEIVE_USERS";
export const RECEIVE_FRIENDS = "RECEIVE_FRIENDS";

const receiveUsers = payload => ({
  type: RECEIVE_USERS,
  payload
});

const receiveFriends = payload => ({
  type: RECEIVE_FRIENDS,
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

export const fetchFriends = () => dispatch =>
  UserUtils.fetchFriends().then(
    receivedUsers => dispatch(receiveFriends(receivedUsers)),
    err => dispatch(receiveUserErrors(err))
  );
