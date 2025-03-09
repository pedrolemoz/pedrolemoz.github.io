import { Experience } from "../../Entities/Experience";
import DataCard from "../DataCard/DataCard";

export default function ExperienceCard({
  experience,
}: {
  experience: Experience;
}) {
  return (
    <DataCard
      startDate={experience.startDate}
      endDate={experience.endDate}
      title={`${experience.role} · ${experience.company}`}
      description={experience.description}
      logo={experience.logo}
      url={experience.url}
      tags={experience.technologies}
    />
  );
}
