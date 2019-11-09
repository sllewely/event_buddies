export const fetchUser = async id => {
  const fetchResult = fetch(`/api/v1/user/${id}`, {
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

export const fetchFriends = async () => {
  const fetchResult = fetch(`/api/v1/friendships`, {
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

export const fetchPendingFriends = async () => {
  const fetchResult = fetch(`/api/v1/friendship_requests`, {
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

export const createUser = async user => {
  const response = await fetch("/signup", {
    method: "POST",
    headers: {
      Accept: "application/json",
      "Content-type": "application/json",
      "X-CSRF-Token": window.token
    },
    body: JSON.stringify(user)
  });
  if (response.ok) {
    const jsonData = await response.json();
    window.jwt = response.headers.get("authorization");
    return jsonData;
  } else {
    throw Error(response.statusText);
  }
};
