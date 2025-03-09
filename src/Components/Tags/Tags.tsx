import "./Tags.css";

export default function Tags({ tags }: { tags: string[] }) {
  return (
    <ul className="tags">
      {tags.map((tag) => (
        <Tag tag={tag} />
      ))}
    </ul>
  );
}

function Tag({ tag }: { tag: string }) {
  return <li className="tag">{tag}</li>;
}
