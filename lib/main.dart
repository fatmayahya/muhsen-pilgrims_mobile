import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:muhsen_pilgrims_mobile/muhsen_pilgrims_app.dart';
import 'core/network/api_client.dart';
import 'core/router/app_router.dart';
import 'core/constants/api_constants.dart';
import 'muhsen_pilgrims_app.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  // ═══════════════════════════════════════════════════════════
  // 🔹 System UI Configuration
  // ═══════════════════════════════════════════════════════════
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  // ═══════════════════════════════════════════════════════════
  // 🔹 Initialize Dependencies
  // ═══════════════════════════════════════════════════════════
  
  // Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  
  // ✅ Initialize ApiClient globally
  apiClient = ApiClient(prefs: prefs);
  
  print('✅ ApiClient initialized');
  print('🌐 Base URL: ${ApiConstants.baseUrl}');
  
  // ═══════════════════════════════════════════════════════════
  // 🔹 Run App
  // ═══════════════════════════════════════════════════════════
  runApp(const MuhsenPilgrimsApp());
}