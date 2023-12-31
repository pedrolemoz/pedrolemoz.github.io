import '../../models/person_data_model.dart';
import '../core/core_states.dart';

final class GettingPersonDataState implements IProcessingState {}

final class SuccessfullyGotPersonDataState implements ISuccessState {
  final PersonDataModel personDataModel;

  const SuccessfullyGotPersonDataState(this.personDataModel);
}

final class UnableToGetPersonDataState implements IErrorState {
  final Object exception;

  const UnableToGetPersonDataState(this.exception);
}
