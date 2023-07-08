import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/colors.dart';
import 'customized_text.dart';

class CustomizedCart extends StatelessWidget {
  final String image;
  final String location;
  final String place;
  final String discription;
  final VoidCallback delete;

  const CustomizedCart({
    Key? key,
    required this.image,
    required this.location,
    required this.place,
    required this.discription,
    required this.delete,
  }) : super(key: key);

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
                  image: NetworkImage(image), fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomizedText(
                    text: place,
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
                    // direction: Axis.horizontal,
                    // spacing: 2,
                    // runSpacing: 2,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AllColors.mainColor,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 1.5,
                      ),
                      Flexible(
                        child: CustomizedText(
                          text: location,
                          color: Colors.black,
                          size: 11,
                          maxlines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomizedText(
                    text: discription,
                    color: AllColors.SubtitleColor,
                    size: 10,
                    maxlines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomizedText(
                        text: 'See More ......',
                        color: AllColors.mainColor,
                        size: 11,
                      ),
                      IconButton(
                        onPressed: () {
                          delete();
                        },
                        icon: const FaIcon(
                          Icons.delete,
                          color: AllColors.mainColor,
                          size: 14,
                        ),
                      )
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
