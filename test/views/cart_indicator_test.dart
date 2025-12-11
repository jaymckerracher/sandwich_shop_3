import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/views/common_widgets/cart_indicator.dart';

void main() {
  group('CartIndicator', () {
    testWidgets('shows cart icon always', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider<Cart>(
          create: (_) => Cart(),
          child: const MaterialApp(
            home: Scaffold(
              body: CartIndicator(),
            ),
          ),
        ),
      );
      expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
    });

    testWidgets('does not show badge when cart is empty',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider<Cart>(
          create: (_) => Cart(),
          child: const MaterialApp(
            home: Scaffold(
              body: CartIndicator(),
            ),
          ),
        ),
      );
      expect(find.byType(CircleAvatar), findsNothing);
    });
  });
}
