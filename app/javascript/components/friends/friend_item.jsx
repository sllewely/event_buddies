import React from "react";

const FriendItem = ({ friend }) => {
  return (
    <div className="friend__item H_Flex">
      <h1>{friend.first_name}</h1>
    </div>
  );
};

export default FriendItem;
