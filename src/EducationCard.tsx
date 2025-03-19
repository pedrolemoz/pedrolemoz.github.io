import Card from "./Card";
import { Education } from "./models/Education";

export default function EducationCard({
  index,
  education,
}: {
  index: number;
  education: Education;
}) {
  return (
    <Card
      index={index}
      imageUrl={education.logo}
      imageAlternative={education.institution}
      title={`${education.degree} in ${education.field} @ ${education.institution}`}
      startDate={education.startDate}
      endDate={education.endDate}
      description={education.description}
      tags={education.tags}
    />
  );
}
