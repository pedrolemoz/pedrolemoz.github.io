import 'package:auto_injector/auto_injector.dart';
import 'package:http/http.dart' as http;

import '../../controllers/person/person_bloc.dart';
import '../http_client/http_client.dart';
import '../http_client/i_http_client.dart';

final class ServiceLocator {
  const ServiceLocator._();

  static final _autoInjector = AutoInjector();

  static void registerInstances() {
    _autoInjector.addInstance(http.Client());
    _autoInjector.addSingleton<IHttpClient>(HttpClient.new);
    _autoInjector.addSingleton<PersonBloc>(PersonBloc.new);
    _autoInjector.commit();
  }

  static T getInstance<T>() {
    return _autoInjector.get<T>();
  }
}
