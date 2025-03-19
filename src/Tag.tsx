export default function Tag({
  index,
  label,
}: {
  index: number;
  label: string;
}) {
  return (
    <div
      className="text-[#e3e8f0] bg-[#3c096c] p-2 rounded-lg text-sm text-nowrap font-bold uppercase"
      id={index.toString()}
    >
      {label}
    </div>
  );
}
