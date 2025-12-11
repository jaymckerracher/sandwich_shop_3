import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/views/common_widgets/app_bar.dart';

void main() {
  group('SandwichAppBar', () {
    testWidgets('renders title correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: SandwichAppBar(title: 'Test Title'),
          ),
        ),
      );
      expect(find.text('Test Title'), findsOneWidget);
    });

    testWidgets('renders leading widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: SandwichAppBar(
              title: 'Test',
              leading: Icon(Icons.menu),
            ),
          ),
        ),
      );
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('renders actions widgets', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: SandwichAppBar(
              title: 'Test',
              actions: [Icon(Icons.shopping_cart)],
            ),
          ),
        ),
      );
      expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
    });

    testWidgets('applies custom title style', (WidgetTester tester) async {
      const customStyle = TextStyle(fontSize: 30, color: Colors.red);
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: SandwichAppBar(
              title: 'Styled Title',
              titleStyle: customStyle,
            ),
          ),
        ),
      );
      final textWidget = tester.widget<Text>(find.text('Styled Title'));
      expect(textWidget.style?.fontSize, 30);
      expect(textWidget.style?.color, Colors.red);
    });
  });
}
