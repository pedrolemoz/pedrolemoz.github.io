import "./Section.css";

export default function Section({
  title,
  content,
}: {
  title: string;
  content: any;
}) {
  return (
    <div className="section">
      <h2 className="sectionTitle">{title}</h2>
      {content}
    </div>
  );
}
