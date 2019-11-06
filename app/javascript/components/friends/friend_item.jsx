import React from "react";

const FriendItem = ({ friend }) => {
  return (
    <div className="friend__item H_Flex">
      <h1>{friend.name}</h1>
    </div>
  );
};

export default FriendItem;
