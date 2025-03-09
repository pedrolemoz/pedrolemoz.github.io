import { format } from "date-fns";
import "./DataCard.css";
import Tags from "../Tags/Tags";

export default function DataCard({
  startDate,
  endDate,
  title,
  description,
  url,
  logo,
  tags,
}: {
  startDate: Date;
  endDate: Date | null;
  title: string;
  description: string;
  url: string;
  logo: string;
  tags: string[];
}) {
  const formatting = "LLL y";

  return (
    <div className="dataCard">
      <a href={url} target="_blank">
        <img className="dataCardImage" src={logo} />
      </a>
      <div className="dataCardTexts">
        <h2 className="dataCardTitle">{title}</h2>
        <h3 className="dataCardDateInfo">
          {format(startDate, formatting)} —{" "}
          {endDate != null ? format(endDate, formatting) : "Present"}
        </h3>
        <p className="dataCardDescription">{description}</p>
        <Tags tags={tags} />
      </div>
    </div>
  );
}
