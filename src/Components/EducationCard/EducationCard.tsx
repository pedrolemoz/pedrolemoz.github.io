import { Education } from "../../Entities/Education";
import DataCard from "../DataCard/DataCard";

export default function EducationCard({ education }: { education: Education }) {
  return (
    <DataCard
      startDate={education.startDate}
      endDate={education.endDate}
      title={`${education.degree} in ${education.field} · ${education.institution}`}
      description={education.description}
      logo={education.logo}
      url={education.url}
      tags={education.tags}
    />
  );
}
