import { Contact } from "../../Entities/Contact";
import "./Contacts.css";

export function Contacts({ contacts }: { contacts: Contact[] }) {
  const items = contacts.map((contact) => (
    <li>
      <a className="contactLabel" href={contact.url} target="_blank">
        {contact.name}
      </a>
    </li>
  ));

  return <ul className="contacts">{items}</ul>;
}
