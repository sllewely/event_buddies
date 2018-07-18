import React from "react";
import UserProfilePicture from "./user_profile_picture";

const UserAttendance = ({ user, attendance }) => {
  return (
    <div className={`user__attendance ${attendance}`}>
      <UserProfilePicture user={user} />
    </div>
  );
};

export default UserAttendance;
