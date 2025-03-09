export interface Contact {
  name: string;
  url: string;
}

export function contactFromJSON(data: any): Contact {
  return {
    name: data.name,
    url: data.url,
  };
}
