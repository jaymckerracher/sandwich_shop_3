import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

// APP
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sandwich Shop App',
      home: OrderScreen(maxQuantity: 5),
    );
  }
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

// STATE OBJECT
enum SandwichSize { sixInch, footLong }

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;
  SandwichSize _selectedSize = SandwichSize.footLong;

  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _increaseQuantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() => _quantity++);
    }
  }

  void _decreaseQuantity() {
    if (_quantity > 0) {
      setState(() => _quantity--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandwich Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OrderItemDisplay(
              _quantity,
              _selectedSize == SandwichSize.footLong ? 'Footlong' : 'Six Inch',
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StyledButton('Add',
                    _quantity == widget.maxQuantity ? null : _increaseQuantity),
                const SizedBox(width: 32),
                StyledButton(
                    'Remove', _quantity == 0 ? null : _decreaseQuantity),
              ],
            ),
            const SizedBox(height: 24),
            SegmentedButton<SandwichSize>(
              selected: <SandwichSize>{_selectedSize},
              onSelectionChanged: (Set<SandwichSize> newSelection) {
                setState(() {
                  _selectedSize = newSelection.first;
                });
              },
              segments: const <ButtonSegment<SandwichSize>>[
                ButtonSegment<SandwichSize>(
                  value: SandwichSize.sixInch,
                  label: Text('Six Inch'),
                ),
                ButtonSegment<SandwichSize>(
                  value: SandwichSize.footLong,
                  label: Text('Foot Long'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 500,
              child: TextField(
                controller: _noteController,
                decoration: const InputDecoration(
                  hintText: 'Add special requests (e.g., "no onions")',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final int quantity;
  final String itemType;

  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text('$quantity $itemType sandwich(es): ${'🥪' * quantity}');
  }
}

class StyledButton extends StatelessWidget {
  final String text;
  final VoidCallback? callback;

  const StyledButton(this.text, this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.red,
        ),
        child: Text(text),
      ),
    );
  }
}
