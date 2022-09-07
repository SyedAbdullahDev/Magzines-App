// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moharak/Screens/Account/AccountScreen.dart';
import 'package:moharak/Screens/Home/Home.dart';
import 'package:moharak/Screens/Magnines/moremag.dart';
import 'package:moharak/Screens/Quotes/quotes.dart';
import 'package:moharak/Screens/Videos/morevidio.dart';

class Custom_bottombar extends StatelessWidget {
  const Custom_bottombar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue.shade700,
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(
                  const Account_Screen(),
                );
              },
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.to(
                        const Account_Screen(),
                      );
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "سیٹنگ",
                    style: GoogleFonts.notoNastaliqUrdu(
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  const VidioScreen(),
                );
              },
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.to(
                        const VidioScreen(),
                      );
                    },
                    icon: const Icon(
                      Icons.video_file,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "ویڈیوز",
                    style: GoogleFonts.notoNastaliqUrdu(
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  quotescreen(),
                );
              },
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.to(
                        quotescreen(),
                      );
                    },
                    icon: const Icon(
                      Icons.format_quote,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "اقتباس",
                    style: GoogleFonts.notoNastaliqUrdu(
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  MagazinesMore(),
                );
              },
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.to(
                        MagazinesMore(),
                      );
                    },
                    icon: const Icon(
                      Icons.menu_book,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "پبلش",
                    style: GoogleFonts.notoNastaliqUrdu(
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  HomeScreen(),
                );
              },
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.to(
                        const HomeScreen(),
                      );
                    },
                    icon: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "ہوم",
                    style: GoogleFonts.notoNastaliqUrdu(
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
