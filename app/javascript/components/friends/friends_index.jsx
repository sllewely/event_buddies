import React from "react";
import FriendItem from "./friend_item";
import { connect } from "react-redux";
import { fetchFriends } from "../../actions/user_actions.js";

class FriendsIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchFriends();
  }

  render() {
    const allFriends = this.props.friends.map(friend => (
      <FriendItem friend={friend} key={friend.id} />
    ));

    return <div className="friend__index V_Flex">{allFriends}</div>;
  }
}

const msp = state => {
  return {
    friends: state.session.currentUser.friend_ids.map(
      friend_id => state.entities.users[friend_id]
    )
  };
};

const mdp = dispatch => {
  return {
    fetchFriends: () => dispatch(fetchFriends())
  };
};

export default connect(
  msp,
  mdp
)(FriendsIndex);
