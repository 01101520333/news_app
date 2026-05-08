import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:news_app/core/network/resulet_api.dart';

class ApiHandlerHttpE {
  static Future<ResultApi<T>> execute<T>(
    Future<http.Response> Function() action,
    T Function(String body) mapper,
  ) async {
    try {
      final response = await action();
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return SuccessApi(mapper(response.body));
      } else {
        return ErrorApi(_handleStatusCode(response.statusCode));
      }
    } on SocketException {
      return ErrorApi("No Internet Connection");
    } on TimeoutException {
      return ErrorApi("Connection timed out, try again");
    } on FormatException {
      return ErrorApi("Invalid data format received");
    } catch (e) {
      return ErrorApi("Unexpected error: ${e.toString()}");
    }
  }

  static String _handleStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad request, please check your input";
      case 401:
        return "Unauthorized, please login again";
      case 403:
        return "Forbidden: You don't have permission";
      case 404:
        return "Resource not found";
      case 408:
        return "Request timeout, try again";
      case 409:
        return "Conflict occurred during the request";
      case 500:
        return "Internal Server Error, please try later";
      case 502:
        return "Bad gateway";
      case 503:
        return "Service unavailable";
      case 504:
        return "Gateway timeout";
      default:
        return "Received invalid status code: $statusCode";
    }
  }
}
