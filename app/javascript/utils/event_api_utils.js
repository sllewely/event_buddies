export const fetchEvent = async id => {
  const fetchResult = fetch(`/api/v1/event/${id}`, {
    headers: {
      Accept: "application/json",
      "Content-type": "application/json",
      "X-CSRF-Token": window.token,
      authorization: window.jwt
    }
  });
  const response = await fetchResult;
  if (response.ok) {
    const jsonData = await response.json();
    return jsonData;
  } else {
    throw Error(response.statusText);
  }
};

export const fetchEvents = async page => {
  const fetchResult = fetch(`/api/v1/events?page=${page}`, {
    headers: {
      Accept: "application/json",
      "Content-type": "application/json",
      "X-CSRF-Token": window.token,
      authorization: window.jwt
    }
  });
  const response = await fetchResult;
  if (response.ok) {
    const jsonData = await response.json();
    return jsonData;
  } else {
    throw Error(response.statusText);
  }
};

export const postEvent = async event => {
  const response = await fetch("/api/v1/events", {
    method: "POST",
    headers: {
      Accept: "application/json",
      "Content-type": "application/json",
      "X-CSRF-Token": window.token,
      authorization: window.jwt
    },
    body: JSON.stringify(event)
  });
  if (response.ok) {
    const jsonData = await response.json();
    return jsonData;
  } else {
    throw Error(response.statusText);
  }
};

export const postRSVP = async rsvp => {
  const response = await fetch(`/api/v1/events/${rsvp.eventID}/user_event_responses`, {
    method: "POST",
    header: {
      Accept: "application/json",
      "Content-type": "application/json",
      "X-CSRF-Token": window.token,
      authorization: window.jwt
    },
    body: JSON.stringify(rsvp.status)
  });
  if(response.ok) {
    const jsonData = await response.json();
    return jsonData;
  } else {
    throw Error(response.statusText);
  }
};