import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Aboutdev extends StatefulWidget {
  Aboutdev({Key? key}) : super(key: key);

  @override
  State<Aboutdev> createState() => _AboutdevState();
}

class _AboutdevState extends State<Aboutdev> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        centerTitle: true,
        title: Text(
          'محرک میگزین',
          textDirection: TextDirection.rtl,
          style: GoogleFonts.notoNastaliqUrdu(),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Card(
          elevation: 9,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'This App Is Developed By Codelabors!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'This App Is Developed By CodeLabors! Hello there,we are a Web & App Developing Company who has strong knowledge in Web & App Development Specially in E-Commerce Field. Professionally Working in relevant fields for the last 4 years. Our passion is to create beautiful mobile-friendly Websites & Apps.We can redesign or convert your existing WordPress,Shopify  website into WordPress too and also create mobile apps for your business. Feel free to reach out to us so we can start planning your next project.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
