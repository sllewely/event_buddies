import * as moment from "moment";

const TEST_EVENTS = {
  123: {
    id: 123,
    name: "concert",
    date_time: moment()
      .add(4, "d")
      .minutes(0),
    event_link: "http://www.google.com",
    location: "217 E Houston St, New York, NY 10002",
    description:
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    attending: [25, 27, 28, 26, 29, 30],
    needsTickets: [26, 27]
  },
  124: {
    id: 124,
    name: "birthday",
    date_time: moment()
      .add(6, "days")
      .minutes(45)
      .hour(18),
    time: "19:00",
    event_link: "http://www.example.com",
    location: "The Chipped Cup",
    description:
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    attending: [26, 31, 32, 33, 25],
    needsTickets: [25, 31]
  }
};

export default TEST_EVENTS;
