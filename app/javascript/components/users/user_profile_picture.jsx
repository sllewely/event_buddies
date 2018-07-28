import React from "react";

const UserProfilePicture = ({ user }) => {
  return <p className="user__profile__picture">{user.username.slice(0, 2)} </p>;
};

export default UserProfilePicture;
