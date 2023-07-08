import 'dart:convert';

import 'package:ecommerce/controller/products_controller.dart';
import 'package:ecommerce/models/products_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Carts {
  void addCarts(
      {required int id,
      required String title,
      required double price,
      required String description,
      required String category,
      required String image,
      required int rateCount,
      required double rate}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> userCart = {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image,
      "rating": {"rate": rate, "count": rateCount}
    };

    String caart = jsonEncode(userCart);

    List<ProductsModel> products = await getCarts();
    List<String> productss = [];

    for (var data in products) {
      productss.add(jsonEncode(data.toJson()));
    }

    productss.add(caart);

    await prefs.setStringList('userCart', productss);
  }

  Future<List<ProductsModel>> getCarts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String>? storedCart = prefs.getStringList('userCart');

    if (storedCart == null) {
      return [];
    }

    List<ProductsModel> cartss = [];

    for (var data in storedCart) {
      var map = jsonDecode(data);
      ProductsModel model = ProductsModel(
          id: map['id'],
          title: map['title'],
          price: map['price'],
          description: map['description'],
          category: map['category'],
          image: map['image'],
          rating: Rating(
              rate: map['rating']['rate'], count: map['rating']['count']));
      cartss.add(model);
    }
    productsController.showAllCarts = cartss;
    return cartss;
  }

  Future<void> deleteCartItem(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<ProductsModel> products = await getCarts();
    List<String> updatedCartItems = [];

    for (var data in products) {
      if (data.id != id) {
        updatedCartItems.add(jsonEncode(data.toJson()));
      }
    }

    await prefs.setStringList('userCart', updatedCartItems);
  }
}
