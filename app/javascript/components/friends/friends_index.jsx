import React from "react";
import FriendItem from "./friend_item";

const FriendsIndex = ({ friends }) => {
  const allFriends = friends.map(friend => (
    <FriendItem friend={friend} key={friend.id} />
  ));
  return <div className="friend__index V_Flex">{allFriends}</div>;
};

export default FriendsIndex;
