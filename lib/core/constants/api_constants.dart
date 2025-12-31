class ApiConstants {
  // Base URLs
  static const String baseUrl = '';

  // API Endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String profile = '/user/profile';
  static const String updateProfile = '/user/profile/update';
  
  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userKey = 'user_data';
  
  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  
  // Settings
  static const bool enableLogging = true;
  
  // Headers
  static const String contentTypeJson = 'application/json';
  static const String contentTypeFormData = 'multipart/form-data';
}