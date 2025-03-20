export default function ExternalButton({
  name,
  url,
}: {
  name: string;
  url: string;
}) {
  let icon: string;

  switch (true) {
    case name === "GitHub":
      icon = "uil uil-github";
      break;
    case name === "LinkedIn":
      icon = "uil uil-linkedin";
      break;
    case name === "E-mail":
      icon = "uil uil-envelope";
      break;
    case name.includes("Resume"):
      icon = "uil uil-file-download";
      break;
    default:
      icon = "uil uil-link";
      break;
  }

  return (
    <a
      href={url}
      target="_blank"
      className="flex gap-2 items-center text-[#b0b9c7] hover:text-[#e3e8f0]"
    >
      <i className={`${icon} text-3xl`}></i>
      <h3 className="text-lg font-semibold">{name}</h3>
    </a>
  );
}
