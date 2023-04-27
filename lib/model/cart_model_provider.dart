import 'package:flutter/material.dart';
class CardModel extends ChangeNotifier{
//   list of item on sale
    final List _shopeItems = [
    //  [itemName, itemPrice, imagePath, color]
      ["Avocado", "4.00", "lib/images/avocado.png", Colors.green],
      ["Banana", "2.50", "lib/images/banana.png", Colors.yellow],
      ["Chicken", "12.80", "lib/images/chicken.png", Colors.brown],
      ["Water", "1.00", "lib/images/water.png", Colors.blue],
    ];

    List _cardItems = [];

    get shopeItems => _shopeItems;

    get cardItems => _cardItems;

//    add item to card
    void addItemTocart(int index){
      _cardItems.add(_shopeItems[index]);
      notifyListeners();
    }
//    remove Items
    void removeItems(int index){
      _cardItems.removeAt(index);
      notifyListeners();
    }
//    callculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cardItems.length; i++) {
      totalPrice += double.parse(cardItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}