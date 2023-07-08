import 'package:ecommerce/constants/preferences.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/colors.dart';
import 'customized_text.dart';

class CustomizedCart extends StatefulWidget {
  final String image;
  final String rating;
  final String place;
  final String discription;
  final String price;
  final String ratingCount;
  final VoidCallback delete;

  const CustomizedCart({
    Key? key,
    required this.image,
    required this.rating,
    required this.place,
    required this.discription,
    required this.price,
    required this.ratingCount,
    required this.delete,
  }) : super(key: key);

  @override
  State<CustomizedCart> createState() => _CustomizedCartState();
}

class _CustomizedCartState extends State<CustomizedCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AllColors.BoxColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AllColors.SubtitleColor.withOpacity(0.6),
            offset: const Offset(1, 2),
            blurRadius: 2,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              image: DecorationImage(
                  image: NetworkImage(widget.image), fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 8,
                right: 8,
                bottom: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomizedText(
                    text: widget.place,
                    color: Colors.black,
                    size: 14,
                    maxlines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        color: AllColors.mainColor,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 1.5,
                      ),
                      CustomizedText(
                        text: widget.rating,
                        color: Colors.black,
                        size: 11,
                        maxlines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      CustomizedText(
                        text: '/ ${widget.ratingCount}',
                        color: Colors.black,
                        size: 11,
                        maxlines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      CustomizedText(
                        text: '\$ ${widget.price}',
                        color: AllColors.mainColor,
                        size: 11.7,
                        maxlines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomizedText(
                    text: widget.discription,
                    color: AllColors.SubtitleColor,
                    size: 10,
                    maxlines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomizedText(
                        text: 'See More ......',
                        color: AllColors.mainColor,
                        size: 11,
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.delete();
                          setState(() {
                            Carts().getCarts();
                          });
                        },
                        child: const FaIcon(
                          Icons.delete,
                          color: AllColors.mainColor,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
