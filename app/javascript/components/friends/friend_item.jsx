import React from "react";

const FriendItem = ({ friend }) => {
  return (
    <div className="friend__item H_Flex">
      <h1>{friend.first_name}</h1>
      <h2>{friend.last_name}</h2>
    </div>
  );
};

export default FriendItem;
