import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sandwich_shop/main.dart' as app;
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/widgets/common_widgets.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('add a sandwich to the cart and verify it is in the cart',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Test the initial state of the app (on the order screen)
      expect(find.text('Sandwich Counter'), findsOneWidget);
      expect(find.text('Cart: 0 items - £0.00'), findsOneWidget);
      expect(find.text('Veggie Delight'), findsWidgets);

      final addToCartButton = find.widgetWithText(StyledButton, 'Add to Cart');
      await tester.ensureVisible(addToCartButton); // Scroll if needed
      await tester.pumpAndSettle();

      // Add a sandwich to the cart
      await tester.tap(addToCartButton);
      await tester.pumpAndSettle();

      // Verify cart summary updated
      expect(find.text('Cart: 1 items - £11.00'), findsOneWidget);

      // Find the View Cart button to navigate to the cart
      final viewCartButton = find.widgetWithText(StyledButton, 'View Cart');
      await tester.ensureVisible(viewCartButton);
      await tester.pumpAndSettle();
      await tester.tap(viewCartButton);
      await tester.pumpAndSettle();

      // Verify that we're on the cart screen and the sandwich is there
      expect(find.text('Cart'), findsOneWidget);
      expect(find.text('Veggie Delight'), findsOneWidget);
      expect(find.text('Total: £11.00'), findsOneWidget);
    });

    testWidgets('change sandwich type and add to cart',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final sandwichDropdown = find.byType(DropdownMenu<SandwichType>);
      await tester.tap(sandwichDropdown);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Chicken Teriyaki').last);
      await tester.pumpAndSettle();

      final addToCartButton = find.widgetWithText(StyledButton, 'Add to Cart');
      await tester.ensureVisible(addToCartButton);
      await tester.pumpAndSettle();

      await tester.tap(addToCartButton);
      await tester.pumpAndSettle();

      final viewCartButton = find.widgetWithText(StyledButton, 'View Cart');
      await tester.ensureVisible(viewCartButton);
      await tester.pumpAndSettle();

      await tester.tap(viewCartButton);
      await tester.pumpAndSettle();

      expect(find.text('Cart'), findsOneWidget);
      expect(find.text('Chicken Teriyaki'), findsOneWidget);
    });

    testWidgets('modify quantity and add to cart', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final quantitySection = find.text('Quantity: ');
      expect(quantitySection, findsOneWidget);

      // Find the + button that's near the quantity text
      final addButtons = find.byIcon(Icons.add);
      // The + button should be the first one (before the cart + button)
      final quantityAddButton = addButtons.first;

      await tester.tap(quantityAddButton);
      await tester.pumpAndSettle();
      await tester.tap(quantityAddButton);
      await tester.pumpAndSettle();

      expect(find.text('3'), findsOneWidget);

      final addToCartButton = find.widgetWithText(StyledButton, 'Add to Cart');
      await tester.ensureVisible(addToCartButton);
      await tester.pumpAndSettle();

      await tester.tap(addToCartButton);
      await tester.pumpAndSettle();

      expect(find.text('Cart: 3 items - £33.00'), findsOneWidget);
    });

    testWidgets('complete checkout flow', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final addToCartButton = find.widgetWithText(StyledButton, 'Add to Cart');
      await tester.ensureVisible(addToCartButton);
      await tester.tap(addToCartButton);
      await tester.pumpAndSettle();

      final viewCartButton = find.widgetWithText(StyledButton, 'View Cart');
      await tester.ensureVisible(viewCartButton);
      await tester.tap(viewCartButton);
      await tester.pumpAndSettle();

      final checkoutButton = find.widgetWithText(StyledButton, 'Checkout');
      await tester.tap(checkoutButton);
      await tester.pumpAndSettle();

      expect(find.text('Checkout'), findsOneWidget);
      expect(find.text('Order Summary'), findsOneWidget);

      final confirmPaymentButton = find.text('Confirm Payment');
      await tester.tap(confirmPaymentButton);
      await tester.pumpAndSettle();

      // Wait for payment processing (2 seconds + buffer)
      await tester.pump(const Duration(seconds: 3));

      // Should be back on order screen with empty cart
      expect(find.text('Sandwich Counter'), findsOneWidget);
      expect(find.text('Cart: 0 items - £0.00'), findsOneWidget);
    });

    testWidgets('profile update validation and success',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Go to Profile screen
      final profileButton = find.widgetWithText(StyledButton, 'Profile');
      await tester.ensureVisible(profileButton);
      await tester.tap(profileButton);
      await tester.pumpAndSettle();

      // Try to save with empty fields
      final saveButton = find.widgetWithText(ElevatedButton, 'Save Profile');
      await tester.tap(saveButton);
      await tester.pumpAndSettle();
      expect(find.text('Please fill in all fields'), findsOneWidget);

      // Enter valid data and save
      await tester.enterText(find.byType(TextField).at(0), 'Test User');
      await tester.enterText(find.byType(TextField).at(1), 'Test Location');
      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      // Should return to order screen and show welcome message
      expect(find.textContaining('Welcome, Test User!'), findsOneWidget);
    });

    testWidgets('remove item not in cart does nothing',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Go to cart (should be empty)
      final viewCartButton = find.widgetWithText(StyledButton, 'View Cart');
      await tester.ensureVisible(viewCartButton);
      await tester.tap(viewCartButton);
      await tester.pumpAndSettle();

      // Try to find a delete button (should not exist)
      final deleteButton = find.byIcon(Icons.delete);
      expect(deleteButton, findsNothing);
    });

    testWidgets('checkout with empty cart shows error',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Go to cart (should be empty)
      final viewCartButton = find.widgetWithText(StyledButton, 'View Cart');
      await tester.ensureVisible(viewCartButton);
      await tester.tap(viewCartButton);
      await tester.pumpAndSettle();

      // Try to find and tap the Checkout button (should not exist)
      final checkoutButton = find.widgetWithText(StyledButton, 'Checkout');
      expect(checkoutButton, findsNothing);
      // Optionally, check for empty cart message
      expect(find.textContaining('empty'), findsOneWidget);
    });
  });
}
