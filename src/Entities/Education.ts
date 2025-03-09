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
