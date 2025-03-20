import { format } from "date-fns";
import Tag from "./Tag";

const formatting = "LLL y";

export default function Card({
  imageUrl,
  imageAlternative,
  title,
  startDate,
  endDate,
  description,
  tags,
}: {
  imageUrl: string;
  imageAlternative: string;
  title: string;
  startDate: Date;
  endDate: Date | null;
  description: string;
  tags: string[];
}) {
  return (
    <div className="flex flex-col gap-4" id={title}>
      <div className="flex gap-2">
        <img
          className="rounded-lg w-20 h-20"
          src={imageUrl}
          alt={imageAlternative}
        />

        <div className="flex flex-col justify-start gap-2">
          <h3 className="text-xl font-bold">{title}</h3>

          <h4 className="text-sm uppercase">
            {format(startDate, formatting)} -{" "}
            {endDate != null ? format(endDate, formatting) : "Present"}
          </h4>
        </div>
      </div>

      <p className="text-lg text-justify text-[#b0b9c7] font-medium">
        {description}
      </p>

      <div className="flex flex-wrap gap-2">
        {tags.map((tag, index) => (
          <Tag index={index} label={tag} />
        ))}
      </div>
    </div>
  );
}
