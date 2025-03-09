import { Contact } from "./Contact";
import { Education } from "./Education";
import { Experience } from "./Experience";

export interface PersonData {
  firstName: string;
  lastName: string;
  bio: string;
  shortDescription: string;
  fullDescription: string;
  contacts: Contact[];
  education: Education[];
  experiences: Experience[];
}
