import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:muhsen_pilgrims_mobile/muhsen_pilgrims_app.dart';
import 'package:muhsen_pilgrims_mobile/core/network/api_client.dart';
import 'package:muhsen_pilgrims_mobile/core/router/app_router.dart' as router;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    router.apiClient = ApiClient(prefs: prefs);
  });

  testWidgets('App boots without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const MuhsenPilgrimsApp());
    await tester.pumpAndSettle();
    
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}