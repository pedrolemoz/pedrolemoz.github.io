import '../core/core_states.dart';

final class GettingPrivacyPolicyState implements IProcessingState {}

final class SuccessfullyGotPrivacyPolicyState implements ISuccessState {
  final String privacyPolicy;

  const SuccessfullyGotPrivacyPolicyState(this.privacyPolicy);
}

final class UnableToGetPrivacyPolicyState implements IErrorState {
  final Object exception;

  const UnableToGetPrivacyPolicyState(this.exception);
}
