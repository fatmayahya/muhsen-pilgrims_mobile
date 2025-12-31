import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/api_constants.dart';
import '../errors/exceptions.dart';

class ApiClient {
  final Dio _dio;
  final SharedPreferences _prefs;

  ApiClient({required SharedPreferences prefs})
      : _prefs = prefs,
        _dio = Dio() {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.headers['Accept'] = 'application/json';

    // Add interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add auth token
          final token = _getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          print('REQUEST: ${options.method} ${options.path}');
          print('HEADERS: ${options.headers}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('RESPONSE: ${response.statusCode} - ${response.requestOptions.path}');
          return handler.next(response);
        },
        onError: (error, handler) {
          print('ERROR: ${error.message}');
          print('ERROR STATUS: ${error.response?.statusCode}');
          return handler.next(error);
        },
      ),
    );

    // Optional: Add logging interceptor for debugging
    if (ApiConstants.enableLogging) {
      _dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ));
    }
  }

  // Get token from shared preferences
  String? _getToken() {
    return _prefs.getString(ApiConstants.tokenKey);
  }

  // Save token to shared preferences
  Future<void> saveToken(String token) async {
    await _prefs.setString(ApiConstants.tokenKey, token);
  }

  // Remove token from shared preferences
  Future<void> removeToken() async {
    await _prefs.remove(ApiConstants.tokenKey);
  }

  // GET request
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // POST request
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // PUT request
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // PATCH request
  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // DELETE request
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Upload file
  Future<Response> uploadFile(
    String path,
    String filePath, {
    String fileKey = 'file',
    Map<String, dynamic>? data,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final formData = FormData.fromMap({
        fileKey: await MultipartFile.fromFile(filePath),
        if (data != null) ...data,
      });

      return await _dio.post(
        path,
        data: formData,
        onSendProgress: onSendProgress,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Download file
  Future<Response> downloadFile(
    String urlPath,
    String savePath, {
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.download(
        urlPath,
        savePath,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Handle errors
  Exception _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException(
          message: 'Connection timeout',
        );

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data['message'] ?? 
                       error.response?.data['error'] ?? 
                       'Server error';

        switch (statusCode) {
          case 400:
            return BadRequestException(message: message);
          case 401:
            return UnauthorizedException(message: message);
          case 403:
            return ForbiddenException(message: message);
          case 404:
            return NotFoundException(message: message);
          case 500:
          case 502:
          case 503:
            return ServerException(
              message: message,
              statusCode: statusCode,
            );
          default:
            return ServerException(
              message: message,
              statusCode: statusCode,
            );
        }

      case DioExceptionType.cancel:
        return RequestCancelledException(
          message: 'Request cancelled',
        );

      case DioExceptionType.connectionError:
        return NetworkException(
          message: 'No internet connection',
        );

      case DioExceptionType.badCertificate:
        return CertificateException(
          message: 'Certificate verification failed',
        );

      case DioExceptionType.unknown:
      return UnknownException(
          message: error.message ?? 'Unknown error occurred',
        );
    }
  }
}