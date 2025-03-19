export interface Education {
  institution: string;
  degree: string;
  field: string;
  startDate: Date;
  endDate: Date | null;
  description: string;
  url: string;
  logo: string;
  tags: string[];
}

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
