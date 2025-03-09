import { Experience } from "../Entities/Experience";

export function experienceFromJSON(data: any): Experience {
  return {
    startDate: data.startDate,
    endDate: data.endDate,
    role: data.role,
    company: data.company,
    description: data.description,
    technologies: data.technologies,
    url: data.url,
    logo: data.logo,
  };
}
