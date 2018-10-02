export const fetchEvent = async id => {
  const fetchResult = fetch(`/event/${id}`);
  const response = await fetchResult;
  if (response.ok) {
    const jsonData = await response.json();
    return jsonData;
  } else {
    throw Error(response.statusText);
  }
};

export const fetchEvents = async () => {
  const fetchResult = fetch(`/events`);
  const response = await fetchResult;
  if (response.ok) {
    const jsonData = await response.json();
    return jsonData;
  } else {
    throw Error(response.statusText);
  }
};

export const postEvent = async event => {
  const response = await fetch("/events", {
    method: "POST",
    headers: {
      Accept: "application/json",
      "Content-type": "application/json"
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
