import React from "react";

const UserProfilePicture = ({ user }) => {
  return (
    <img
      src={user.userImage}
      alt={user.username}
      className="user__profile__picture"
    />
  );
};

export default UserProfilePicture;
