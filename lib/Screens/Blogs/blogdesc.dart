// ignore_for_file: must_be_immutable, camel_case_types, prefer_typing_uninitialized_variables
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description_Screen extends StatefulWidget {
  Description_Screen(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  var image;
  final String title;
  final String description;

  @override
  State<Description_Screen> createState() => _Description_ScreenState();
}

class _Description_ScreenState extends State<Description_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: FancyShimmerImage(
                  boxFit: BoxFit.cover,
                  errorWidget: Image.network(
                      'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                  imageUrl: widget.image,
                ),
              ),
              Container(
                color: Colors.blue,
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  widget.title,
                  style: GoogleFonts.notoNastaliqUrdu(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              Text(
                widget.description,
                style: GoogleFonts.notoNastaliqUrdu(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
