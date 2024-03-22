import 'package:bloc/bloc.dart';

import '../../packages/http_client/i_http_client.dart';
import '../core/core_states.dart';
import 'privacy_policy_events.dart';
import 'privacy_policy_states.dart';

class PrivacyPolicyBloc extends Bloc<IPrivacyPolicyEvents, IAppState> {
  final IHttpClient _httpClient;

  PrivacyPolicyBloc(this._httpClient) : super(InitialState()) {
    on<GetPrivacyPolicyEvent>(_onGetPrivacyPolicyEvent);
  }

  Future<void> _onGetPrivacyPolicyEvent(
    GetPrivacyPolicyEvent event,
    Emitter<IAppState> emit,
  ) async {
    emit(GettingPrivacyPolicyState());

    try {
      final url = event.url;

      final response = await _httpClient.get(url);

      if (response.isSuccess) {
        emit(SuccessfullyGotPrivacyPolicyState(response.data));
      } else {
        emit(UnableToGetPrivacyPolicyState(response));
      }
    } catch (exception) {
      emit(UnableToGetPrivacyPolicyState(exception));
    }
  }
}
