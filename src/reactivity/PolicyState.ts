import { PolicyStatus } from "./PolicyStatus";

export interface PolicyState {
  status: PolicyStatus;
  data: string | null;
}

export function copyWith<PolicyState>(
  original: PolicyState,
  partial: Partial<PolicyState>
): PolicyState {
  return { ...original, ...partial };
}
