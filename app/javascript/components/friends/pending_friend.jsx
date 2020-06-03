import React from "react";
import FriendItem from "./friend_item";
import { connect } from "react-redux";
import {
  acceptPendingFriend,
  rejectPendingFriend
} from "../../actions/user_actions.js";

const PendingFriend = ({
  pendingFriend,
  acceptPendingFriend,
  rejectPendingFriend,
  findRequestById
}) => {
  return (
    <div className="H_Flex">
      <FriendItem friend={pendingFriend} />
      <div className="V_Flex">
        <button
          onClick={() => acceptPendingFriend(findRequestById(pendingFriend.id))}
        >
          Accept
        </button>
        <button
          onClick={() => rejectPendingFriend(findRequestById(pendingFriend.id))}
        >
          Reject
        </button>
        <button>Hide</button>
      </div>
    </div>
  );
};

const msp = state => {
  return {
    findRequestById: id => state.entities.friendRequests[id]
  };
};

const mdp = dispatch => {
  return {
    acceptPendingFriend: id => dispatch(acceptPendingFriend(id)),
    rejectPendingFriend: id => dispatch(rejectPendingFriend(id))
  };
};

export default connect(
  msp,
  mdp
)(PendingFriend);
