import * as UserUtils from "../utils/user_api_utils";

export const RECEIVE_USER_ERRORS = "RECEIVE_USER_ERRORS";
export const RECEIVE_USERS = "RECEIVE_USERS";
export const RECEIVE_FRIENDS = "RECEIVE_FRIENDS";
export const RECEIVE_PENDING_FRIENDS = "RECEIVE_PENDING_FRIENDS";
export const REMOVE_PENDING_FRIEND = "REMOVE_PENDING_FRIEND";
export const ACCEPT_PENDING_FRIEND = "ACCEPT_PENDING_FRIEND";

const receiveUsers = payload => ({
  type: RECEIVE_USERS,
  payload
});

const receiveFriends = payload => ({
  type: RECEIVE_FRIENDS,
  payload
});

const receivePendingFriends = payload => ({
  type: RECEIVE_PENDING_FRIENDS,
  payload
});

const receiveUserErrors = payload => ({
  type: RECEIVE_USER_ERRORS,
  payload
});

const addPendingFriend = payload => ({
  type: ACCEPT_PENDING_FRIEND,
  payload
});

const removePendingFriend = payload => ({
  type: REMOVE_PENDING_FRIEND,
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

export const fetchPendingFriends = () => dispatch =>
  UserUtils.fetchPendingFriends().then(
    receivedUsers => dispatch(receivePendingFriends(receivedUsers)),
    err => dispatch(receiveUserErrors(err))
  );

export const acceptPendingFriend = id => dispatch =>
  UserUtils.acceptPendingFriend(id).then(
    receivedUser => dispatch(addPendingFriend(receivedUser)),
    err => dispatch(receiveUserErrors(err))
  );

export const rejectPendingFriend = id => dispatch =>
  UserUtils.rejectPendingFriend(id).then(
    receivedUser => dispatch(removePendingFriend(receivedUser)),
    err => dispatch(receiveUserErrors(err))
  );
