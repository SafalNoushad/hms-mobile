import 'dart:convert';

import 'package:hms_mobile/common/constants/env.dart';
import 'package:hms_mobile/common/services/token_storage.dart';
import 'package:http/http.dart' as http;

String get baseUrl => '${Environment.apiUrl}/public/v1';

class ApiManager {
  static final ApiManager _instance = ApiManager._internal();

  factory ApiManager() => _instance;

  ApiManager._internal();

  String _visitorToken = '';
  String _token = '';

  ApiManager.tokenInstance() {
    final tokenStorage = TokenStorage.instance;
    _token = Environment.authToken;
    _visitorToken = tokenStorage.getVisitorToken() ?? '';
  }

  Map<String, String> get _defaultHeader => {'Content-Type': 'application/json', 'authToken': _token};

  Map<String, String> get _visitorHeader => {'Content-Type': 'application/json', 'authToken': Environment.authToken, 'visitorToken': _visitorToken};

  Future<http.Response> get(String endpoint, {withToken = false}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.get(url, headers: withToken ? _visitorHeader : _defaultHeader);
    return response;
  }

  Future<http.Response> post(String endpoint, dynamic body, {withToken = false}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.post(url, headers: withToken ? _visitorHeader : _defaultHeader, body: jsonEncode(body));
    return response;
  }
}
