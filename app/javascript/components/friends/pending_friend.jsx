import React from "react";
import FriendItem from "./friend_item";

const PendingFriend = ({ friend }) => {
  return (
    <div className="H_Flex">
      <FriendItem friend={friend} />
      <div className="V_Flex">
        <button>Accept</button>
        <button>Reject</button>
        <button>Hide</button>
      </div>
    </div>
  );
};

export default PendingFriend;
