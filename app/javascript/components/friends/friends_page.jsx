import React from "react";
import PendingFriendsIndex from "./pending_friends_index";
import FriendIndex from "./friends_index";
import { Link } from "react-router-dom";
import { fetchFriends } from "../../utils/user_api_utils.js";

const FriendsPage = () => {
  return (
    <div className="V_Flex">
      <div className="H_Flex">
        <h1>Manage Friends</h1>
        <div className="V_Flex">
          <Link to="/friend_search">Add Friend</Link>
          <Link to="/invite_friend">Invite Friend</Link>
        </div>
      </div>
      <PendingFriendsIndex />
      <FriendIndex />
    </div>
  );
}

export default FriendsPage;
