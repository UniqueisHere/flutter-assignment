import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomizedAddToCartButton extends StatefulWidget {
  final VoidCallback buttonPressed;

  const CustomizedAddToCartButton({
    Key? key,
    required this.buttonPressed,
  }) : super(key: key);

  @override
  State<CustomizedAddToCartButton> createState() =>
      _CustomizedAddToCartButtonState();
}

class _CustomizedAddToCartButtonState extends State<CustomizedAddToCartButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        widget.buttonPressed();
        setState(() {
          if (isFavorite == true) {
            isFavorite = false;
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: AllColors.mainColor,
                content: Text("Romoved From Your Favorite"),
              ),
            );
          } else {
            isFavorite = true;
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: AllColors.mainColor,
                content: Text("Added To Your Favourite"),
              ),
            );
          }
          // isFavorite ? isFavorite = false : isFavorite = true;
        });
      },
      icon: Icon(
        Icons.favorite,
        size: 35,
        color: isFavorite ? AllColors.mainColor : Colors.white,
      ),
    );
  }
}
