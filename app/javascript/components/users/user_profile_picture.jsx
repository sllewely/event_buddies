import React from "react";

const UserProfilePicture = ({ user }) => {
  return (
    <span className="user__profile__picture">{user.username.slice(0, 1)} </span>
  );
};

export default UserProfilePicture;
