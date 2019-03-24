import React from "react";
import ReactDOM from "react-dom";
import configureStore from "../store/store";
import Root from "../components/root";

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  const token = document.getElementsByName("csrf-token")[0].content;
  window.token = token;
  window.store = store;
  ReactDOM.render(
    <Root store={store} />,
    document.body.appendChild(document.createElement("root"))
  );
});
