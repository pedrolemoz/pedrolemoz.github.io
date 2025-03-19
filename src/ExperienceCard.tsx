import Card from "./Card";
import { Experience } from "./models/Experience";

export default function ExperienceCard({
  index,
  experience,
}: {
  index: number;
  experience: Experience;
}) {
  return (
    <Card
      index={index}
      imageUrl={experience.logo}
      imageAlternative={experience.company}
      title={`${experience.role} @ ${experience.company}`}
      startDate={experience.startDate}
      endDate={experience.endDate}
      description={experience.description}
      tags={experience.technologies}
    />
  );
}
