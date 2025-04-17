import { Route, Routes } from "react-router-dom";
import HomePage from "./HomePage";
import PolicyPage from "./PolicyPage";

export default function App() {
  return (
    <Routes>
      <Route path="/" element={<HomePage />} />
      <Route
        path="/apps/smartnotes/policy/"
        element={<PolicyPage path="policy/smartnotes/policy.md" />}
      />
    </Routes>
  );
}
