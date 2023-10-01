import 'dart:convert';
import 'package:flutter_shopping_cart/data/shared_preferences/token_manager.dart';
import 'package:http/http.dart' as http;

class ApiClient {

  ApiClient({required this.httpClient});
  static const baseUrl = 'http://42.1.66.103:443';

  final http.Client httpClient;

  Future<dynamic> get(String endpoint) async {
    final response = await httpClient.get(Uri.parse('$baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    final headers = await _buildHeaders();
    final response = await httpClient.post(
      Uri.parse('$baseUrl/$endpoint'),
      body: jsonEncode(data),
      headers: headers,
    );
    return _handleResponse(response);
  }

  Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
    final headers = await _buildHeaders();
    final response = await httpClient.put(
      Uri.parse('$baseUrl/$endpoint'),
      body: jsonEncode(data),
      headers: headers,
    );
    return _handleResponse(response);
  }

  Future<dynamic> delete(String endpoint) async {
    final headers = await _buildHeaders();
    final response = await httpClient.delete(
        Uri.parse('$baseUrl/$endpoint'),
        headers: headers,
    );
    return _handleResponse(response);
  }

  Future<Map<String, String>> _buildHeaders() async {
    final authToken = await TokenManager.getToken();
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken',
      'content-type': 'application/json'
    };
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data from API');
    }
  }
}

// Sử dụng API Client
final apiClient = ApiClient(httpClient: http.Client());
