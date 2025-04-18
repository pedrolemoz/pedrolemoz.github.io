import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import "./index.css";
import { BrowserRouter } from "react-router-dom";
import App from "./App.tsx";

handleRedirectFrom404();

createRoot(document.getElementById("root")!).render(
  <StrictMode>
    <BrowserRouter>
      <App />
    </BrowserRouter>
  </StrictMode>
);

function handleRedirectFrom404() {
  const urlParams = new URLSearchParams(window.location.search);
  const redirect = urlParams.get("redirect");
  if (redirect) {
    window.history.replaceState(null, "", redirect);
  }
}
