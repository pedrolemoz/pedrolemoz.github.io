export interface Experience {
  startDate: Date;
  endDate: Date | null;
  role: string;
  company: string;
  description: string;
  technologies: string[];
  url: string;
  logo: string;
}

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
