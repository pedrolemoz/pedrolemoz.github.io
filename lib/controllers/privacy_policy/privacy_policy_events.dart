abstract interface class IPrivacyPolicyEvents {}

final class GetPrivacyPolicyEvent implements IPrivacyPolicyEvents {
  final String url;

  const GetPrivacyPolicyEvent({required this.url});
}
