import { Education } from "../Entities/Education";

export function educationFromJSON(data: any): Education {
  return {
    institution: data.institution,
    degree: data.degree,
    field: data.field,
    startDate: data.startDate,
    endDate: data.endDate,
    description: data.description,
    url: data.url,
    logo: data.logo,
    tags: data.tags,
  };
}
