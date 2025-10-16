import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandwich Shop App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Sandwich Counter')),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // centers vertically
            crossAxisAlignment: CrossAxisAlignment.center, // centers horizontally
            children: [
              SandwhichContainer(5, 'Footlong'),
              SizedBox(height: 20),
              SandwhichContainer(2, 'Bacon'),
              SizedBox(height: 20),
              SandwhichContainer(4, 'Club'),
            ],
          ),
        ),
      ),
    );
  }
}

class SandwhichContainer extends StatelessWidget {
  final String itemType;
  final int quantity;

  const SandwhichContainer(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 300,
      height: 100,
      color: Colors.blue,
      child: OrderItemDisplay(quantity, itemType),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;

  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text('$quantity $itemType sandwich(es): ${'🥪' * quantity}');
  }
}