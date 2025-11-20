import 'package:flutter/foundation.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

class Cart extends ChangeNotifier {
  final Map<Sandwich, int> _items = {};
  final PricingRepository _pricingRepository = PricingRepository();

  Map<Sandwich, int> get items => _items;

  void addToCart(Sandwich sandwich) {
    _items.update(sandwich, (value) => value + 1, ifAbsent: () => 1);
    notifyListeners();
  }

  void removeFromCart(Sandwich sandwich) {
    _items.remove(sandwich);
    notifyListeners();
  }

  void updateQuantity(Sandwich sandwich, int newQuantity) {
    if (newQuantity > 0) {
      _items[sandwich] = newQuantity;
    } else {
      _items.remove(sandwich);
    }
    notifyListeners();
  }

  double getItemPrice(Sandwich sandwich) {
    final quantity = _items[sandwich] ?? 0;
    return _pricingRepository.calculatePrice(
      quantity: quantity,
      isFootlong: sandwich.isFootlong,
    );
  }

  double get totalPrice {
    double total = 0;
    _items.forEach((sandwich, quantity) {
      total += _pricingRepository.calculatePrice(
        quantity: quantity,
        isFootlong: sandwich.isFootlong,
      );
    });
    return total;
  }
}
