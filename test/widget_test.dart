import 'package:flutter_test/flutter_test.dart';
import 'package:muhsen_pilgrims_mobile/muhsen_pilgrims_app.dart';

void main() {
  testWidgets('App boots without crashing', (tester) async {
    await tester.pumpWidget(const MuhsenPilgrimsApp());
    await tester.pumpAndSettle();

    // If the app throws during build, the test will fail automatically.
    expect(find.byType(MuhsenPilgrimsApp), findsOneWidget);
  });
}