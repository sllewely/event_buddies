export const fetchUser = async id => {
  const fetchResult = fetch(`/api/v1/user/${id}`);
  const response = await fetchResult;
  if (response.ok) {
    const jsonData = await response.json();
    return jsonData;
  } else {
    throw Error(response.statusText);
  }
};

export const fetchUsers = async () => {
  const fetchResult = fetch(`/api/v1/users`);
  const response = await fetchResult;
  if (response.ok) {
    const jsonData = await response.json();
    return jsonData;
  } else {
    throw Error(response.statusText);
  }
};

export const postUser = async user => {
  const response = await fetch("/users", {
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

// export const deleteUser = async () => {
//   const response = await fetch("/users/cancel", {
//     method: "DELETE",
//     headers: {
//       Accept: "application/json",
//       "Content-type": "application/json",
//       "X-CSRF-Token": window.token
//     },
//   });
//   if (response.ok) {
//     return;
//   } else {
//     throw Error(response.statusText);
//   }
// };
