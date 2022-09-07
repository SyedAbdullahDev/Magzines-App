// ignore_for_file: file_names

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moharak/Screens/Magnines/moremag.dart';
import 'package:moharak/Screens/Magnines/pdf.dart';
import 'package:moharak/Widgets/nav_bar.dart';

class Description extends StatefulWidget {
  const Description({
    Key? key,
    required this.image,
    required this.title,
    required this.date,
    required this.read,
    required this.preview,
  }) : super(key: key);
  final String image;
  final String read;
  final String preview;
  final String title;
  final String date;
  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Custom_bottombar(),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        centerTitle: true,
        title: Text(
          'محرک میگزین',
          textDirection: TextDirection.rtl,
          style: GoogleFonts.notoNastaliqUrdu(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 400,
                width: 250,
                child: FancyShimmerImage(
                  boxFit: BoxFit.cover,
                  errorWidget: Image.network(
                      'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                  imageUrl: widget.image,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(pdfviewerm(reed: widget.preview));
              },
              child: Container(
                color: Colors.blue,
                height: 50,
                width: 260,
                child: Text(
                  "پریویو",
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoNastaliqUrdu(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Get.to(pdfviewerm(reed: widget.read));
              },
              child: Container(
                color: Colors.red,
                height: 50,
                width: 260,
                child: Text(
                  "پڑھیں",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.notoNastaliqUrdu(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: Card(
                elevation: 7,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            "مزید دیکھیں",
                            textDirection: TextDirection.rtl,
                            style: GoogleFonts.notoNastaliqUrdu(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 2),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 220,
                                      width: 155,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(
                                            MagazinesMore(),
                                          );
                                        },
                                        child: FancyShimmerImage(
                                          boxFit: BoxFit.cover,
                                          errorWidget: Image.network(
                                              'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                                          imageUrl:
                                              "https://firebasestorage.googleapis.com/v0/b/magazine-5afff.appspot.com/o/pdf%2Fmagazines%2F7LICv3K6E8mwK9BS2uvn%2F1.JPG?alt=media&token=b1f00ec1-52ad-4bc9-8574-466a1ccce541",
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'ماہنامہ محرک میگزین',
                                      textDirection: TextDirection.rtl,
                                      style: GoogleFonts.notoNastaliqUrdu(),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 220,
                                      width: 155,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(
                                            MagazinesMore(),
                                          );
                                        },
                                        child: FancyShimmerImage(
                                          boxFit: BoxFit.cover,
                                          errorWidget: Image.network(
                                              'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                                          imageUrl:
                                              "https://firebasestorage.googleapis.com/v0/b/magazine-5afff.appspot.com/o/pdf%2Fmagazines%2F0uo1vPkD6qmEcb9boxPm%2FMonthly%20MUHARRIK%20Magazine%20(August%202022).jpg?alt=media&token=1f3eae66-0114-486e-a683-f44ba8fef35e",
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'ماہنامہ محرک میگزین',
                                      textDirection: TextDirection.rtl,
                                      style: GoogleFonts.notoNastaliqUrdu(),
                                    ),
                                  ],
                                ),
                              ),
                              //---
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 220,
                                      width: 155,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(
                                            MagazinesMore(),
                                          );
                                        },
                                        child: FancyShimmerImage(
                                          boxFit: BoxFit.cover,
                                          errorWidget: Image.network(
                                              'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                                          imageUrl:
                                              "https://firebasestorage.googleapis.com/v0/b/magazine-5afff.appspot.com/o/pdf%2Fmagazines%2FYLCiM2CqlvyyQDtmmtpA%2FMonthly%20Moharek%20Magazine%20(JULY%202022).jpg?alt=media&token=176f7097-88af-4e53-9084-9b935382120a",
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'ماہنامہ محرک میگزین',
                                      textDirection: TextDirection.rtl,
                                      style: GoogleFonts.notoNastaliqUrdu(),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 220,
                                      width: 155,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(
                                            MagazinesMore(),
                                          );
                                        },
                                        child: FancyShimmerImage(
                                          boxFit: BoxFit.cover,
                                          errorWidget: Image.network(
                                              'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                                          imageUrl:
                                              "https://firebasestorage.googleapis.com/v0/b/magazine-5afff.appspot.com/o/pdf%2Fmagazines%2FbLw0n1oC4ffWirckMPJk%2FWhatsApp%20Image%202022-06-05%20at%2012.56.20%20AM%20(1).jpeg?alt=media&token=c55707d5-63df-4d1a-a4c7-7635da08ae12",
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'ماہنامہ محرک میگزین',
                                      textDirection: TextDirection.rtl,
                                      style: GoogleFonts.notoNastaliqUrdu(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
