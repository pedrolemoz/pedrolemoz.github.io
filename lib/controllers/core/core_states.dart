abstract interface class IAppState {}

abstract interface class IProcessingState extends IAppState {}

abstract interface class ISuccessState extends IAppState {}

abstract interface class IErrorState extends IAppState {}

final class InitialState implements IAppState {}
