import { PersonData } from "../../Entities/PersonData";
import { Contacts } from "../Contacts/Contacts";
import "./BasicInfo.css";

export default function BasicInfo({ personData }: { personData: PersonData }) {
  const fullName = `${personData.firstName} ${personData.lastName}`;

  return (
    <div className="basicInfo">
      <div className="basicInfoUpperSection">
        <h1 className="basicInfoName">{fullName}</h1>
        <h2 className="basicInfoBio">{personData.bio}</h2>
        <h3 className="basicInfoShortDescription">
          {personData.shortDescription}
        </h3>
      </div>
      <Contacts contacts={personData.contacts} />
    </div>
  );
}
