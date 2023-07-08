import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/controller/products_controller.dart';
import 'package:ecommerce/widgets/customized_cart.dart';
import 'package:ecommerce/widgets/customized_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../services/product_services.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    ProductServices.showAllProductServices(context: context);
    call_cart();
    super.initState();
  }

  void call_cart() {
    productsController.showAllCarts;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.chevronLeft,
                      color: Colors.black26,
                    ),
                  ),
                  const CustomizedText(
                    text: 'Added Products Appears Here',
                    color: AllColors.mainColor,
                    size: 20,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: productsController.showAllCarts.length,
                itemBuilder: (context, index) {
                  var caarts = productsController.showAllCarts[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomizedCart(
                      image: caarts.image,
                      location: caarts.title,
                      place: caarts.price.toString(),
                      discription: caarts.description,
                      delete: () {},
                    ),
                  );
                },
              ),
            )
          ],
        );
      })),
    );
  }
}
