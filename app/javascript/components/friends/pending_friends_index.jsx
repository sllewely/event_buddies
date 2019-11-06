import React from "react";
import PendingFriend from "./pending_friend";

const PendingFriendsIndex = ({ pendingFriends }) => {
  const allPendingFriends = pendingFriends.map(pendingFriend => (
    <PendingFriend pendingFriend={pendingFriend} key={pendingFriend.id} />
  ));
  return <div className="event__section V_Flex">{allPendingFriends}</div>;
};

export default PendingFriendsIndex;
