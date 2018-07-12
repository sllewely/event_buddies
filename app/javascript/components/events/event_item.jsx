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
    const visibility = this.state.expanded
      ? "event__item_expanded"
      : "event__item_hidden";
    return (
      <article className="event__item V_Flex">
        <section className="H_Flex">
          <div className="V_Flex">
            <div className="H_Flex">
              <h1>{event.name}</h1>
              <span className="event__item_spacer">@</span>
              <h1>{event.location}</h1>
            </div>
            <a href={event.tickets} target="_blank" className={visibility}>
              Buy Tickets here
            </a>
          </div>
          <div className="V_Flex">
            <div className="H_Flex">
              <h1>{event.date}</h1>
              <i
                className="material-icons md-36 md-dark event__item_toggle"
                onClick={this.toggleExpandedInfo()}
              >
                {this.state.expanded ? "expand_less" : "expand_more"}
              </i>
            </div>
            <h1 className={visibility}>{event.time}</h1>
          </div>
        </section>
        <p className={visibility}>{event.description}</p>
      </article>
    );
  }
}

export default EventItem;
