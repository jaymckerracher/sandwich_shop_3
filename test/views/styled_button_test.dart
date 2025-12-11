import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/views/common_widgets/styled_button.dart';

void main() {
  group('StyledButton', () {
    testWidgets('renders icon and label', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StyledButton(
              onPressed: null,
              icon: Icons.add,
              label: 'Add',
              backgroundColor: Colors.blue,
            ),
          ),
        ),
      );
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Add'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (WidgetTester tester) async {
      bool pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StyledButton(
              onPressed: () {
                pressed = true;
              },
              icon: Icons.check,
              label: 'Confirm',
              backgroundColor: Colors.green,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(StyledButton));
      expect(pressed, isTrue);
    });

    testWidgets('uses correct background color', (WidgetTester tester) async {
      const bgColor = Colors.purple;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StyledButton(
              onPressed: null,
              icon: Icons.star,
              label: 'Star',
              backgroundColor: bgColor,
            ),
          ),
        ),
      );
      final elevatedButton =
          tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final style = elevatedButton.style;
      expect(style?.backgroundColor?.resolve({}), bgColor);
    });
  });
}
