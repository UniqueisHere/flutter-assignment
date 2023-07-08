import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as gett;
import 'package:http/http.dart';

class HttpHandler {
  static void handleHttpError({
    required BuildContext context,
    required Response response,
    required VoidCallback onSuccess,
  }) {
    switch (response.statusCode) {
      case 200:
        onSuccess();
        break;
      case 201:
        onSuccess();
        break;
      case 400:
        if (json.decode(response.body)['error'] != null) {
          String error = json.decode(response.body)['error'];
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     duration: const Duration(milliseconds: 1000),
          //     behavior: SnackBarBehavior.floating,
          //     backgroundColor: Colors.red,
          //     content: Text(
          //       error,
          //       style: GoogleFonts.poppins(
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // );
          gett.Get.snackbar(
            'Something went wrong!',
            error,
            backgroundColor: Colors.redAccent,
          );
        } else if (json.decode(response.body)['email'] != null) {
          String error = json.decode(response.body)['email'][0];
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     duration: const Duration(milliseconds: 1000),
          //     behavior: SnackBarBehavior.floating,
          //     backgroundColor: Colors.red,
          //     content: Text(
          //       error,
          //       style: GoogleFonts.poppins(
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // );
          gett.Get.snackbar(
            'Something went wrong!',
            error,
            backgroundColor: Colors.redAccent,
          );
        } else if (json.decode(response.body)['password'] != null) {
          String error = json.decode(response.body)['password'][0];
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     duration: const Duration(milliseconds: 1000),
          //     behavior: SnackBarBehavior.floating,
          //     backgroundColor: Colors.red,
          //     content: Text(
          //       'Please enter more than 4 letters to register.',
          //       style: GoogleFonts.poppins(
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // );
          gett.Get.snackbar(
            'Something went wrong!',
            error,
            backgroundColor: Colors.redAccent,
          );
        }
        break;
      default:
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     duration: const Duration(milliseconds: 700),
        //     behavior: SnackBarBehavior.floating,
        //     content: Text(
        //       'Unable to connect to server. Please try later',
        //       style: GoogleFonts.poppins(
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // );
        gett.Get.snackbar(
          'Something went wrong!',
          backgroundColor: Colors.redAccent,
          'Unable to connect to server. Please try later',
        );
        break;
    }
  }
}
