// ignore_for_file: unused_field
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moharak/Screens/SignIn/signIn.dart';

class pdfviewerm extends StatelessWidget {
  pdfviewerm({Key? key, required this.reed}) : super(key: key);
  final String reed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          onPressed: () {
            Get.to(Sign_In());
          },
        ),
        title: Text(
          'محرک میگزین',
          textDirection: TextDirection.rtl,
          style: GoogleFonts.notoNastaliqUrdu(),
        ),
      ),
      body: const PDF(
        swipeHorizontal: true,
      ).cachedFromUrl(
        reed,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
