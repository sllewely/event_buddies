import React from "react";
import { Link } from "react-router-dom";

class EventItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      expanded: false
    };
  }
  toggleExpandedInfo() {
    return e =>
      this.setState(prevState => ({
        expanded: !prevState.expanded
      }));
  }

  render() {
    const { event } = this.props;
    const expandedInfo = this.state.expanded ? (
      <section>
        <a href={event.tickets} target="_blank">
          Buy Tickets here
        </a>
        <p>{event.description}</p>
        <h3>{event.location}</h3>
      </section>
    ) : (
      <div />
    );
    return (
      <article>
        <h1>{event.name}</h1>
        <h2>{event.date}</h2>
        <h3>{event.time}</h3>
        <div onClick={this.toggleExpandedInfo()}>
          {this.state.expanded ? "Less Info" : "More Info"}
        </div>
        {expandedInfo}
      </article>
    );
  }
}

export default EventItem;
