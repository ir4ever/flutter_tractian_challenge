import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tractian_challenge/core/http/client_http.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(i) {
    i.addLazySingleton<IHttpClient>(HttpClient.new);
  }
}
