import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String title;
  final String ratings;
  final String totalVotes;
  final String category;
  final String description;
  final String image;
  const ProductDetailsScreen({
    super.key,
    required this.title,
    required this.ratings,
    required this.totalVotes,
    required this.category,
    required this.description,
    required this.image,
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
                    color: AllColors.scaffoldColor,
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
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: AllColors.mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Category:',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: const Color.fromARGB(255, 174, 223, 255),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              category,
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: AllColors.mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Description:',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 174, 223, 255),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          description,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AllColors.mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Ratings:',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: const Color.fromARGB(255, 174, 223, 255),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              ratings,
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: AllColors.mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Total Counts:',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: const Color.fromARGB(255, 174, 223, 255),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              totalVotes,
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: AllColors.mainColor,
                                fontWeight: FontWeight.bold,
                              ),
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
                    Get.back();
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
