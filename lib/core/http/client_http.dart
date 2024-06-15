import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future<HttpReponse> get(String path, {Map<String, String>? headers});
}

const _baseUrl = 'https://fake-api.tractian.com';

class HttpClient implements IHttpClient {
  @override
  Future<HttpReponse> get(String path, {Map<String, String>? headers}) async {
    try {
      final url = Uri.parse('$_baseUrl/$path');
      final response = await http.get(url, headers: headers);
      return HttpReponse(
          data: jsonDecode(response.body), statusCode: response.statusCode, message: response.reasonPhrase);
    } catch (e) {
      log('HTTP GET\n PATH: /$path\n ERRO: ${e.toString()}');
      rethrow;
    }
  }
}

class HttpReponse {
  final dynamic data;
  final int? statusCode;
  final String? message;

  const HttpReponse({required this.data, this.statusCode, this.message});
}
