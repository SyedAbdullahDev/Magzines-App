import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moharak/Screens/Account/user.dart';
import 'package:moharak/Screens/SignIn/signIn.dart';

class viewmoreq extends StatefulWidget {
  const viewmoreq({Key? key, required this.qote, required this.name})
      : super(key: key);
  final String qote;
  final String name;

  @override
  State<viewmoreq> createState() => _viewmoreqState();
}

class _viewmoreqState extends State<viewmoreq> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade500,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              if (FirebaseAuth.instance.currentUser != null) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => UserScreen()));
              } else {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Sign_In()));
              }
            },
          ),
          title: Text(
            'محرک میگزین',
            textDirection: TextDirection.rtl,
            style: GoogleFonts.notoNastaliqUrdu(),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: Container(
                color: Colors.black,
                height: 300,
                width: 550,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.qote,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.notoNastaliqUrdu(
                            textStyle: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "\"${widget.name}\"",
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.notoNastaliqUrdu(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
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
