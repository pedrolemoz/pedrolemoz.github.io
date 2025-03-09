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
