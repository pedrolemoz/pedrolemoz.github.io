import { Experience } from "../../Entities/Experience";
import ExperienceCard from "../ExperienceCard/ExperienceCard";
import Section from "../Section/Section";
import "./ExperiencesInfo.css";

export default function ExperiencesInfo({
  experiences,
}: {
  experiences: Experience[];
}) {
  return (
    <Section
      title="Experiences"
      content=<ul className="list">
        {experiences.map((experience) => (
          <li>
            <ExperienceCard experience={experience} />
          </li>
        ))}
      </ul>
    />
  );
}
