import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  testWidgets('OrderScreen displays initial state and increments/decrements',
      (tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
    expect(find.text('Sandwich Counter'), findsOneWidget);

    // Increment
    await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
    await tester.pumpAndSettle();
    expect(find.text('1 white footlong sandwich(es): 🥪'), findsOneWidget);

    // Decrement
    await tester.tap(find.widgetWithText(ElevatedButton, 'Remove'));
    await tester.pumpAndSettle();
    expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
  });

  testWidgets('OrderScreen bread type changes with dropdown', (tester) async {
    await tester.pumpWidget(const App());
    await tester.tap(find.byType(DropdownMenu<BreadType>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('wheat').last);
    await tester.pumpAndSettle();
    expect(find.textContaining('wheat footlong sandwich'), findsOneWidget);
  });

  testWidgets('OrderScreen toggles sandwich size with Switch', (tester) async {
    await tester.pumpWidget(const App());
    expect(find.textContaining('footlong sandwich'), findsOneWidget);
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(find.textContaining('six-inch sandwich'), findsOneWidget);
  });

  testWidgets('OrderScreen updates note with TextField', (tester) async {
    await tester.pumpWidget(const App());
    await tester.enterText(
        find.byKey(const Key('notes_textfield')), 'No onions');
    await tester.pumpAndSettle();
    expect(find.text('Note: No onions'), findsOneWidget);
  });

  testWidgets('StyledButton renders with icon and label', (tester) async {
    const testButton = StyledButton(
      onPressed: null,
      icon: Icons.add,
      label: 'Test Add',
      backgroundColor: Colors.blue,
    );
    const testApp = MaterialApp(
      home: Scaffold(body: testButton),
    );
    await tester.pumpWidget(testApp);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text('Test Add'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('OrderItemDisplay shows correct text and emoji', (tester) async {
    const widgetToBeTested = OrderItemDisplay(
      quantity: 2,
      itemType: 'six-inch',
      breadType: BreadType.wheat,
      orderNote: 'No pickles',
    );
    const testApp = MaterialApp(
      home: Scaffold(body: widgetToBeTested),
    );
    await tester.pumpWidget(testApp);
    expect(find.text('2 wheat six-inch sandwich(es): 🥪🥪'), findsOneWidget);
    expect(find.text('Note: No pickles'), findsOneWidget);
  });
}
