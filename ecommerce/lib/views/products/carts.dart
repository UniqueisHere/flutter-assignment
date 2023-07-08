import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/constants/preferences.dart';
import 'package:ecommerce/controller/products_controller.dart';
import 'package:ecommerce/widgets/customized_cart.dart';
import 'package:ecommerce/widgets/customized_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

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
    // ProductServices.showAllProductServices(context: context);
    Carts().getCarts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () {
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
                productsController.showAllCarts.isEmpty
                    ? const SizedBox(
                        height: 400,
                        width: 400,
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 300,
                                width: 300,
                                child: RiveAnimation.asset(
                                  'lib/assests/not-found.riv',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              CustomizedText(
                                text:
                                    "Seems like you haven't added products to the carts.",
                                color: AllColors.mainColor,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: productsController.showAllCarts.length,
                          itemBuilder: (context, index) {
                            var caarts = productsController.showAllCarts[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomizedCart(
                                price: caarts.price.toString(),
                                image: caarts.image,
                                rating: caarts.price.toString(),
                                ratingCount: caarts.rating.count.toString(),
                                place: caarts.title.toString(),
                                discription: caarts.description,
                                delete: () {
                                  Carts().deleteCartItem(caarts.id);
                                  Carts().getCarts();
                                  Carts().getCarts();
                                  setState(() {});
                                },
                              ),
                            );
                          },
                        ),
                      )
              ],
            );
          },
        ),
      ),
    );
  }
}
