import React from "react";

const UserProfilePicture = ({ userImage, username }) => {
  return (
    <img src={userImage} alt={username} className="user__profile__picture" />
  );
};

export default UserProfilePicture;
