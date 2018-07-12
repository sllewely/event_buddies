import * as EventUtils from "../utils/event_api_utils";

// export const RECEIVE_EVENT = 'RECEIVE_EVENT';
export const RECEIVE_EVENT_ERRORS = "RECEIVE_EVENT_ERRORS";
export const RECEIVE_EVENTS = "RECEIVE_EVENTS";

const receiveEvents = payload => ({
  type: RECEIVE_EVENTS,
  payload
});

const receiveEventErrors = payload => ({
  type: RECEIVE_EVENT_ERRORS,
  payload
});

export const fetchEvent = id => dispatch =>
  EventUtils.fetchEvent(id).then(
    receivedEvent => dispatch(receiveEvents(receivedEvent)),
    err => dispatch(receiveEventErrors(err))
  );

export const fetchEvents = id => dispatch =>
  EventUtils.fetchEvents().then(
    receivedEvents => dispatch(receiveEvents(receiveEvents)),
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
