import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prak_pertemuan5/main.dart';

void main() {
  testWidgets('Hotel reservation catalog smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the title and hotel details are displayed.
    expect(find.text('Staycation Booking Hub'), findsOneWidget);
    expect(find.text('The Grand Luxury Heritage Suite'), findsOneWidget);
    expect(find.byIcon(Icons.hotel), findsWidgets);
  });
}
