import { Education } from "../../Entities/Education";
import EducationCard from "../EducationCard/EducationCard";
import Section from "../Section/Section";
import "./EducationInfo.css";

export default function EducationInfo({
  education,
}: {
  education: Education[];
}) {
  return (
    <Section
      title="Education"
      content=<ul className="list">
        {education.map((education) => (
          <li>
            <EducationCard education={education} />
          </li>
        ))}
      </ul>
    />
  );
}
