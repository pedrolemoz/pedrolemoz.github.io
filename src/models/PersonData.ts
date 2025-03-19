import { Contact, contactFromJSON } from "./Contact";
import { Education, educationFromJSON } from "./Education";
import { Experience, experienceFromJSON } from "./Experience";

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

export function personDataFromJSON(data: any): PersonData {
  return {
    firstName: data.information.firstName,
    lastName: data.information.lastName,
    bio: data.information.bio,
    shortDescription: data.information.shortDescription,
    fullDescription: data.information.fullDescription,
    contacts: data.information.contacts.map(contactFromJSON),
    education: data.education.map(educationFromJSON),
    experiences: data.experiences.map(experienceFromJSON),
  };
}
