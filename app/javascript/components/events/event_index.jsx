import React from "react";
import { connect } from "react-redux";
import EventItem from "./event_item";
import { fetchEvents } from "../../actions/event_actions.js";
import { merge } from "lodash";
import EventSection from "./event_section";
import * as moment from "moment";

class EventsIndex extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isloading: false,
      pageNumber: 1
    };
    window.onscroll = () => {
      if (
        window.innerHeight + document.documentElement.scrollTop ===
        document.documentElement.offsetHeight
      ) {
        this.fetchOffsetEvents(this.state.pageNumber + 1);
      }
    };
  }

  componentDidMount() {
    this.fetchOffsetEvents(this.state.pageNumber);
  }

  fetchOffsetEvents(page) {
    if (this.state.isLoading) return;
    this.props
      .fetchEvents(page)
      .then(this.setState({ isLoading: false, pageNumber: page }));
  }

  // TODO: find all dates of events

  findAllDates() {
    let eventsByDate = {};
    this.props.events.forEach(event => {
      eventsByDate = merge(eventsByDate, {
        [event.date_time.format("dddd, MMMM Do YYYY")]: { [event.id]: event }
      });
    });
    return eventsByDate;
  }

  render() {
    const eventsByDate = this.findAllDates();
    const dates = Object.keys(eventsByDate);
    const dateEventsTuple = dates.map(date => {
      return [date, Object.values(eventsByDate[date])];
    });

    const allEvents = dateEventsTuple.map((tuple, idx) => (
      <EventSection date={tuple[0]} events={tuple[1]} key={idx} />
    ));
    return <div className="V_Flex">{allEvents}</div>;
  }
}

const msp = state => {
  return {
    events: Object.values(state.entities.events).sort((a, b) =>
      a.date_time.diff(b.date_time)
    )
  };
};

const mdp = dispatch => {
  return {
    fetchEvents: page => dispatch(fetchEvents(page))
  };
};

export default connect(
  msp,
  mdp
)(EventsIndex);
