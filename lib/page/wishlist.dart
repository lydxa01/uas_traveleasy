import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uas_traveleasy/page/wishlist_item.dart';

class WishlistProvider extends ChangeNotifier {
  late FirebaseFirestore _firestore;
  List<WishlistItem> _wishlist = [];

  WishlistProvider() {
    _firestore = FirebaseFirestore.instance;
    _loadWishlist();
  }

  List<WishlistItem> get wishlist => _wishlist;

  Future<void> _loadWishlist() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('wishlist').get();
      _wishlist = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return WishlistItem(name: data['name'], description: data['description']);
      }).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading wishlist: $e');
    }
  }

  void addItem(WishlistItem item) async {
    try {
      await _firestore.collection('wishlist').add({
        'name': item.name,
        'description': item.description,
      });
      _loadWishlist();
    } catch (e) {
      print('Error adding item: $e');
    }
  }

  void removeItem(WishlistItem item) async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('wishlist').where('name', isEqualTo: item.name).get();
      snapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
      _loadWishlist();
    } catch (e) {
      print('Error removing item: $e');
    }
  }
}
