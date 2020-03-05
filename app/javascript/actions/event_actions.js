import * as EventUtils from "../utils/event_api_utils";

// export const RECEIVE_EVENT = 'RECEIVE_EVENT';
export const RECEIVE_EVENT_ERRORS = "RECEIVE_EVENT_ERRORS";
export const RECEIVE_EVENTS = "RECEIVE_EVENTS";
export const RECEIVE_RSVP = "RECEIVE_RSVP";
export const RECEIVE_RSVP_ERRORS = "RECEIVE_RSVP_ERRORS";

const receiveEvents = payload => ({
  type: RECEIVE_EVENTS,
  payload
});

const receiveEventErrors = payload => ({
  type: RECEIVE_EVENT_ERRORS,
  payload
});

const receiveRSVP = payload => ({
  type: RECEIVE_RSVP,
  payload
});

const receiveRSVPErrors = payload => ({
  type: RECEIVE_RSVP_ERRORS,
  payload
});

export const fetchEvent = id => dispatch =>
  EventUtils.fetchEvent(id).then(
    receivedEvent => dispatch(receiveEvents(receivedEvent)),
    err => dispatch(receiveEventErrors(err))
  );

export const fetchEvents = page => dispatch =>
  EventUtils.fetchEvents(page).then(
    receivedEvents => dispatch(receiveEvents(receivedEvents)),
    err => dispatch(receiveEventErrors(err))
  );

export const postEvent = event => dispatch =>
  EventUtils.postEvent(event).then(
    receivedEvent => dispatch(receiveEvents(receivedEvent)),
    err => {
      dispatch(receiveEventErrors(err));
      throw new Error("shit went down");
    }
  );

  export const postRSVP = rsvp => dispatch =>
  EventUtils.postRSVP(rsvp).then(
    receivedRSVP => dispatch(receiveRSVP(receivedRSVP)),
    err => dispatch(receiveRSVPErrors(err))
  )
