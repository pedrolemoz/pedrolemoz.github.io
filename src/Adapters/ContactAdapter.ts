import { Contact } from "../Entities/Contact";

export function contactFromJSON(data: any): Contact {
  return {
    name: data.name,
    url: data.url,
  };
}
