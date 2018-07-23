import React from "react";
import UserProfilePicture from "./user_profile_picture";

class UserAttendance extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      hovered: false
    };
  }

  toggleHover(bool) {
    return e =>
      this.setState({
        hovered: bool
      });
  }

  render() {
    const { user, attendance } = this.props;
    const visibility = this.state.hovered
      ? "attendance__bubble_hovered"
      : "attendance__bubble_hidden";
    return (
      <div>
        <div
          onMouseEnter={this.toggleHover(true)}
          onMouseLeave={this.toggleHover(false)}
          className={`user__attendance ${attendance}`}
        >
          <UserProfilePicture user={user} />
        </div>
        <div className={`${visibility}`}>{`${
          user.username
        } is ${attendance}`}</div>
      </div>
    );
  }
}

export default UserAttendance;
