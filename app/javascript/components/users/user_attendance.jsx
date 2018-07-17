import React from "react";
import UserProfilePicture from "./user_profile_picture";

const UserAttendance = ({ user, eventId }) => {
  return (
    <div className={`user__attendance ${user.attendance.eventId.status}`}>
      <UserProfilePicture user={user} />
    </div>
  );
};
