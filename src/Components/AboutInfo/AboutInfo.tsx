import { PersonData } from "../../Entities/PersonData";
import Section from "../Section/Section";
import "./AboutInfo.css";

export default function AboutInfo({ personData }: { personData: PersonData }) {
  return (
    <Section
      title="About"
      content=<p className="aboutInfo">{personData.fullDescription}</p>
    />
  );
}
