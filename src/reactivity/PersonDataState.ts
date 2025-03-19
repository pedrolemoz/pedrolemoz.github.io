import { PersonData } from "../models/PersonData";
import { PersonDataStatus } from "./PersonDataStatus";

export interface PersonDataState {
  status: PersonDataStatus;
  data: PersonData | null;
}

export function copyWith<PersonDataState>(
  original: PersonDataState,
  partial: Partial<PersonDataState>
): PersonDataState {
  return { ...original, ...partial };
}
