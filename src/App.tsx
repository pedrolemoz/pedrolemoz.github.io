import { Route, Routes } from "react-router-dom";
import HomePage from "./HomePage";
import PolicyPage from "./PolicyPage";
import { useEffect } from "react";

export default function App() {
  useEffect(() => {
    const params = new URLSearchParams(window.location.search);
    const redirectPath = params.get("p");
    if (redirectPath) {
      window.history.replaceState({}, "", redirectPath);
    }
  }, []);

  return (
    <Routes>
      <Route path="/" element={<HomePage />} />
      <Route
        path="/policy"
        element={<PolicyPage path="policy/smartnotes/policy.md" />}
      />
    </Routes>
  );
}
