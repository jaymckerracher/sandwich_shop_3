import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';

void main() {
  testWidgets('Cart summary updates when item is added',
      (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    // Cart summary should start at 0
    expect(find.textContaining('Items in cart: 0'), findsOneWidget);
    expect(find.textContaining('Total: £0.00'), findsOneWidget);

    // Ensure the Add to Cart button is visible before tapping
    final addButton = find.byKey(const Key('addToCartButton'));
    await tester.ensureVisible(addButton);
    await tester.tap(addButton);
    await tester.pumpAndSettle();

    // Cart summary should update
    expect(find.textContaining('Items in cart: 1'), findsOneWidget);
    expect(find.textContaining('Total: £'), findsOneWidget);
  });

  testWidgets('Cart summary reflects multiple adds',
      (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    // Tap the + button to increase quantity to 2
    final plusButton = find.widgetWithIcon(IconButton, Icons.add);
    await tester.ensureVisible(plusButton);
    await tester.tap(plusButton);
    await tester.pumpAndSettle();
    // Now tap Add to Cart (should add 2 sandwiches)
    final addButton = find.byKey(const Key('addToCartButton'));
    await tester.ensureVisible(addButton);
    await tester.tap(addButton);
    await tester.pumpAndSettle();
    expect(find.textContaining('Items in cart: 2'), findsOneWidget);
  });
}
