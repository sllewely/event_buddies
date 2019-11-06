export const login = async user => {
  const response = await fetch("/login", {
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
    return [jsonData, window.jwt];
  } else {
    throw Error(response.statusText);
  }
};

export const logout = async () => {
  const response = await fetch("/logout", {
    method: "DELETE",
    headers: {
      "Content-Type": "application/json",
      "X-CSRF-Token": window.token,
      authorization: window.jwt
    }
  });
  if (response.ok) {
    return;
  } else {
    throw Error(response.statusText);
  }
};
