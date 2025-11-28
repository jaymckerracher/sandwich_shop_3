import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';

void main() {
  testWidgets(
    'SnackBar appears with correct message when item is added to cart',
    (WidgetTester tester) async {
      // Use tester.view to set the window size (Flutter 3.10+)
      final originalSize = tester.view.physicalSize;
      final originalDevicePixelRatio = tester.view.devicePixelRatio;
      tester.view.physicalSize = const Size(1200, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.physicalSize = originalSize;
        tester.view.devicePixelRatio = originalDevicePixelRatio;
      });

      await tester.pumpWidget(const App());

      final addButton = find.byKey(const Key('addToCartButton'));
      await tester.ensureVisible(addButton);
      await tester.tap(addButton);
      await tester.pump(); // Allow SnackBar to appear

      // The SnackBar should appear with the correct confirmation message
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.textContaining(
            'Added 1 footlong Veggie Delight sandwich(es) on white bread to cart'),
        findsOneWidget,
      );

      // Wait for the SnackBar to disappear (duration + animation)
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle(); // Wait for exit animation
      expect(find.byType(SnackBar), findsNothing);
    },
  );
}
