export const fetchEvent = async id => {
  const fetchResult = fetch(`/api/v1/event/${id}`);
  const response = await fetchResult;
  if (response.ok) {
    const jsonData = await response.json();
    return jsonData;
  } else {
    throw Error(response.statusText);
  }
};

export const fetchEvents = async () => {
  const fetchResult = fetch(`/api/v1/events`);
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
      "X-CSRF-Token": window.token
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
