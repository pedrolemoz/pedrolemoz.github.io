import { PersonData } from "../Entities/PersonData";
import { contactFromJSON } from "./ContactAdapter";
import { educationFromJSON } from "./EducationAdapter";
import { experienceFromJSON } from "./ExperienceAdapter";

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
