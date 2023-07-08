import 'package:ecommerce/constants/preferences.dart';
import 'package:ecommerce/widgets/customized_favourite_button.dart';
import 'package:ecommerce/widgets/customized_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../services/product_services.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int id;
  final String title;
  final String ratings;
  final String totalVotes;
  final String category;
  final String description;
  final String image;
  final String price;
  const ProductDetailsScreen({
    super.key,
    required this.title,
    required this.ratings,
    required this.totalVotes,
    required this.category,
    required this.description,
    required this.image,
    required this.price,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  // color: Colors.green,
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.darken),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 220,
                left: 0,
                bottom: 0,
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 219, 219, 219),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        25,
                      ),
                      topRight: Radius.circular(
                        25,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      15,
                      20,
                      15,
                      20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomizedText(
                          text: title.toUpperCase(),
                          color: AllColors.mainColor,
                          size: 22,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const CustomizedText(
                              text: 'Category: ',
                              color: AllColors.textColor,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            CustomizedText(
                              text: category.toUpperCase(),
                              color: AllColors.mainColor,
                              size: 13,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const CustomizedText(
                              text: 'Price: ',
                              color: AllColors.textColor,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            CustomizedText(
                              text: '\$ $price',
                              color: AllColors.mainColor,
                              size: 13,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomizedText(
                          text: 'Descriptions: ',
                          color: AllColors.textColor,
                          size: 15,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomizedText(
                          text: description,
                          color: AllColors.mainColor,
                          size: 13,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const CustomizedText(
                              text: 'Ratings: ',
                              color: AllColors.textColor,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            CustomizedText(
                              text: ratings,
                              color: AllColors.mainColor,
                              size: 13,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const CustomizedText(
                              text: 'Total Counts: ',
                              color: AllColors.textColor,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            CustomizedText(
                              text: totalVotes,
                              color: AllColors.mainColor,
                              size: 13,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: IconButton(
                  onPressed: () {
                    ProductServices.showAllProductServices(context: context);
                    Carts().getCarts();

                    Get.back();
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: CustomizedAddToCartButton(
                  buttonPressed: () {
                    Carts().addCarts(
                        id: id,
                        title: title,
                        price: double.parse(price),
                        description: description,
                        category: category,
                        image: image,
                        rateCount: int.parse(totalVotes),
                        rate: double.parse(ratings));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
