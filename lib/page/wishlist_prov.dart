import 'package:flutter/material.dart';
import 'wishlist_item.dart';



class WishlistProvider extends ChangeNotifier {
  List<WishlistItem> _wishlist = [];

  List<WishlistItem> get wishlist => _wishlist;

  void addItem(WishlistItem item) {
    _wishlist.add(item);
    notifyListeners();
  }

  void removeItem(WishlistItem item) {
    _wishlist.remove(item);
    notifyListeners();
  }
}
