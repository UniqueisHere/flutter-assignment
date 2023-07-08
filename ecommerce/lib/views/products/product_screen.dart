import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/controller/products_controller.dart';
import 'package:ecommerce/services/product_services.dart';
import 'package:ecommerce/views/products/carts.dart';
import 'package:ecommerce/views/products/product_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/preferences.dart';
import '../../models/products_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final TextEditingController searchProducts = TextEditingController();

  @override
  void initState() {
    ProductServices.showAllProductServices(context: context);
    gettingData();
    super.initState();
  }

  void gettingData() {
    productsController.showAllCarts;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Obx(() {
          return Scaffold(
            // backgroundColor: const Color.fromARGB(255, 151, 151, 151),
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 60,
                            width: 300,
                            child: TextFormField(
                              onChanged: (value) {
                                List<ProductsModel> empty = [];

                                for (var item
                                    in productsController.searchResult) {
                                  if (item.title.toLowerCase().contains(
                                      searchProducts.text.toLowerCase())) {
                                    empty.add(item);
                                  }
                                }

                                setState(() {
                                  productsController.searchResult = empty;
                                });
                              },
                              controller: searchProducts,
                              autocorrect: false,
                              decoration: InputDecoration(
                                labelText: 'Search Products',
                                labelStyle: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: const Color.fromARGB(230, 92, 92, 92),
                                ),
                                hintText: 'Mens Casula Premium Slim',
                                // alignLabelWithHint: false,
                                prefixIcon: const FaIcon(
                                  FontAwesomeIcons.searchengin,
                                  size: 25,
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintStyle: GoogleFonts.poppins(),
                                border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabled: true,
                              ),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                Carts().getCarts();

                                Get.to(const CartScreen());
                              },
                              icon: const Icon(
                                Icons.favorite,
                                color: AllColors.mainColor,
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: productsController.searchResult.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1 / 1.74,
                        ),
                        itemBuilder: (context, index) {
                          var productDetails =
                              productsController.searchResult[index];
                          // print(controller.movies.results.length);
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                ProductDetailsScreen(
                                  id: productDetails.id,
                                  title: productDetails.title,
                                  ratings:
                                      productDetails.rating.rate.toString(),
                                  totalVotes:
                                      productDetails.rating.count.toString(),
                                  category: productDetails.category,
                                  description: productDetails.description,
                                  image: productDetails.image,
                                  price: productDetails.price.toString(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    // color: Colors.black.withOpacity(0.1),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 2,
                                        offset: const Offset(1, 2),
                                      )
                                    ]),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(8),
                                      height: 250,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        // color: Colors.blue,
                                        borderRadius: BorderRadius.circular(
                                          20,
                                        ),
                                        image: DecorationImage(
                                          colorFilter: const ColorFilter
                                              .linearToSrgbGamma(),
                                          image: NetworkImage(
                                              productDetails.image),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            productDetails.title.toUpperCase(),
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: AllColors.scaffoldColor,

                                              // fontWeight: FontWeight.w100,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: AllColors.mainColor,
                                              ),
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                productDetails.rating.rate
                                                    .toString(),
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  color:
                                                      AllColors.scaffoldColor,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '/ ${productDetails.rating.count.toString()}',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  color:
                                                      AllColors.scaffoldColor,
                                                  // fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                '\$ ${productDetails.price}',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  color: AllColors.mainColor,
                                                  // fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
