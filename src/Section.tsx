export default function Section({
  label,
  content,
}: {
  label: string;
  content: any;
}) {
  return (
    <section className="flex flex-col gap-4">
      <h2 className="text-2xl font-bold uppercase">{label}</h2>
      <div className="flex flex-col gap-6">{content}</div>
    </section>
  );
}
