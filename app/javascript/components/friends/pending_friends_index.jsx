import React from "react";
import PendingFriend from "./pending_friend";
import { connect } from "react-redux";
import { fetchPendingFriends } from "../../actions/user_actions.js";

class PendingFriendsIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchPendingFriends();
  }

  render() {
    const allPendingFriends = this.props.pendingFriends.map(pendingFriend => (
      <PendingFriend pendingFriend={pendingFriend} key={pendingFriend.id} />
    ));

    return <div className="event__section V_Flex">{allPendingFriends}</div>;
  }
}

const msp = state => {
  return {
    pendingFriends: state.session.currentUser.pendingFriendIds.map(
      pendingFriendId => state.entities.users[pendingFriendId]
    )
  };
};

const mdp = dispatch => {
  return {
    fetchPendingFriends: () => dispatch(fetchPendingFriends())
  };
};

export default connect(
  msp,
  mdp
)(PendingFriendsIndex);
