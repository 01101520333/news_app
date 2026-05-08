import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_app/core/handler/resulet_api.dart';

class ApiHandlerDioA {
  static Future<ResultApi<T>> execute<T>(Future<T> Function() action) async {
    try {
      final response = await action();
      return SuccessApi(response);
    } on Exception catch (e) {
      return ErrorApi(_handleError(e));
    }
  }

  static String _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return "وقت الاتصال انتهى، حاول مرة تانية.";
        case DioExceptionType.sendTimeout:
          return "فشل إرسال البيانات، تحقق من الشبكة.";
        case DioExceptionType.receiveTimeout:
          return "السيرفر اتأخر في الرد، حاول لاحقاً.";
        case DioExceptionType.badResponse:
          return _handleStatusCode(error.response?.statusCode);
        case DioExceptionType.cancel:
          return "تم إلغاء الطلب.";
        case DioExceptionType.connectionError:
          return "مفيش اتصال بالإنترنت، تأكد من الواي فاي أو الداتا.";
        default:
          return "حصل خطأ غير متوقع، جرب تاني.";
      }
    } else if (error is SocketException) {
      return "لا يوجد اتصال بالإنترنت.";
    } else {
      return "حدث خطأ ما: ${error.toString()}";
    }
  }

  static String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return "طلب خاطئ، تأكد من البيانات المدخلة.";
      case 401:
        return "غير مسموح لك بالدخول، سجل دخولك مرة تانية.";
      case 403:
        return "ليس لديك صلاحية للوصول لهذا المصدر.";
      case 404:
        return "المعلومات اللي بتدور عليها مش موجودة.";
      case 500:
        return "مشكلة في السيرفر، بنحاول نحلها حالياً.";
      default:
        return "حصل خطأ في السيرفر (كود: $statusCode)";
    }
  }
}

class ApiHandlerDioE {
  static Future<ResultApi<T>> execute<T>(Future<T> Function() action) async {
    try {
      final response = await action();
      return SuccessApi(response);
    } on Exception catch (e) {
      return ErrorApi(_handleError(e));
    }
  }

  static String _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return "Connection timeout with API server";
        case DioExceptionType.sendTimeout:
          return "Send timeout in connection with API server";
        case DioExceptionType.receiveTimeout:
          return "Receive timeout in connection with API server";
        case DioExceptionType.badCertificate:
          return "Internal Certificate Validation Error";
        case DioExceptionType.connectionError:
          return "No Internet Connection";
        case DioExceptionType.badResponse:
          return _handleStatusCode(error.response?.statusCode);
        case DioExceptionType.cancel:
          return "Request to API server was cancelled";
        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            return "Please check your internet connection";
          }
          return "Unexpected error occurred";
      }
    } else if (error is SocketException) {
      return "No Internet Connection";
    } else if (error is FormatException) {
      return "Bad response format from server";
    } else {
      return "Unknown error: ${error.toString()}";
    }
  }

  static String _handleStatusCode(int? statusCode) {
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
