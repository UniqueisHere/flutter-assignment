import 'dart:convert';
import 'package:ecommerce/controller/products_controller.dart';
import 'package:ecommerce/models/products_model.dart';

import '../constants/http_handler.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  static Future<void> showAllProductServices({
    required BuildContext context,
    String? query,
  }) async {
    try {
      String path = 'https://fakestoreapi.com/products';
      http.Response response = await http.get(
        Uri.parse(path),
      );

      HttpHandler.handleHttpError(
        response: response,
        context: context,
        onSuccess: () async {
          List<ProductsModel> viewAllProducts = [];
          for (var data in json.decode(response.body)) {
            viewAllProducts.add(ProductsModel.fromJson(data));
          }
          productsController.showAllProducts(viewAllProducts);
          productsController.searchResult = viewAllProducts;
        },
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 2000),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          content: Text(
            error.toString(),
            style: GoogleFonts.poppins(
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }
}
