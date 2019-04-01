export const login = async user => {
  const response = await fetch("/users/sign_in", {
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
    return jsonData;
  } else {
    throw Error(response.statusText);
  }
};

export const logout = async () => {
  const response = await fetch("/users/sign_out", {
    method: "DELETE",
    headers: {
      "Content-Type": "application/json",
      "X-CSRF-Token": window.token
    },
    credentials: "same-origin"
  });
  if (response.ok) {
    return;
  } else {
    throw Error(response.statusText);
  }
};
