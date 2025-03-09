import { PersonData } from "../../Entities/PersonData";
import AboutInfo from "../AboutInfo/AboutInfo";
import EducationInfo from "../EducationInfo/EducationInfo";
import ExperiencesInfo from "../ExperienceInfo/ExperiencesInfo";
import "./DetailedInfo.css";

export default function DetailedInfo({
  personData,
}: {
  personData: PersonData;
}) {
  return (
    <div className="detailedInfo">
      <AboutInfo personData={personData} />
      <EducationInfo education={personData.education} />
      <ExperiencesInfo experiences={personData.experiences} />
    </div>
  );
}
