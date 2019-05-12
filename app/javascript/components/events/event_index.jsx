import React from "react";
import { connect } from "react-redux";
import EventItem from "./event_item";
import { fetchEvents } from "../../actions/event_actions.js";
import { merge } from "lodash";
import EventSection from "./event_section";
import EventEnd from "./event_end";
import * as moment from "moment";

class EventsIndex extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoading: false,
      pageNumber: 1,
      pageEnd: false
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
    if (this.state.isLoading || this.state.pageEnd) return;

    this.setState({ isLoading: true });
    this.props.fetchEvents(page).then(
      result => {
        let newState;
        if (result.payload.length < 25) {
          newState = { pageEnd: true };
        }
        newState = merge(newState, { isLoading: false, pageNumber: page });
        this.setState(newState);
      },
      () => this.setState({ isLoading: false })
    );
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
    const pageEnd = this.state.pageEnd ? <EventEnd /> : <h1>More loading</h1>;
    const dateEventsTuple = dates.map(date => {
      return [date, Object.values(eventsByDate[date])];
    });

    const allEvents = dateEventsTuple.map((tuple, idx) => (
      <EventSection date={tuple[0]} events={tuple[1]} key={idx} />
    ));
    return (
      <div className="V_Flex">
        {allEvents}
        {pageEnd}
      </div>
    );
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
