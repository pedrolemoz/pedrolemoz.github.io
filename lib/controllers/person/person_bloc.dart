import 'package:bloc/bloc.dart';

import '../../models/person_data_model.dart';
import '../../packages/http_client/i_http_client.dart';
import '../../utils/routes.dart';
import '../core/core_states.dart';
import 'person_events.dart';
import 'person_states.dart';

class PersonBloc extends Bloc<IPersonEvents, IAppState> {
  final IHttpClient _httpClient;

  PersonBloc(this._httpClient) : super(InitialState()) {
    on<GetPersonDataEvent>(_onGetPersonDataEvent);
  }

  Future<void> _onGetPersonDataEvent(
    IPersonEvents event,
    Emitter<IAppState> emit,
  ) async {
    emit(GettingPersonDataState());

    try {
      const url = Routes.personData;

      final response = await _httpClient.get(url);

      if (response.isSuccess) {
        final personDataModel = PersonDataModel.fromJSON(response.data);
        emit(SuccessfullyGotPersonDataState(personDataModel));
      } else {
        emit(UnableToGetPersonDataState(response));
      }
    } catch (exception) {
      emit(UnableToGetPersonDataState(exception));
    }
  }
}
