// ignore_for_file: use_build_context_synchronously, camel_case_types, file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moharak/Screens/Account/developer.dart';
import 'package:moharak/Screens/Account/user.dart';
import 'package:moharak/Screens/SignIn/signIn.dart';
import 'package:moharak/Widgets/nav_bar.dart';
import 'package:rate/rate.dart';
import 'package:share_plus_dialog/share_plus_dialog.dart';

class Account_Screen extends StatefulWidget {
  const Account_Screen({Key? key}) : super(key: key);

  @override
  State<Account_Screen> createState() => _Account_ScreenState();
}

class _Account_ScreenState extends State<Account_Screen> {
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
      body: Center(
        child: Column(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                if (FirebaseAuth.instance.currentUser != null) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => UserScreen()));
                } else {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Sign_In()));
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.blue,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                'اکاونٹ',
                                style: GoogleFonts.notoNastaliqUrdu(
                                  textStyle: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.person,
                                color: Colors.blue,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ShareDialog.share(context,
                    'https://play.google.com/store/apps/details?id=com.moharek.app',
                    platforms: SharePlatform.defaults);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.blue,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                'انوایٹ',
                                style: GoogleFonts.notoNastaliqUrdu(
                                  textStyle: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.share,
                                color: Colors.blue,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Expanded(
                      child: AlertDialog(
                        title: Text('ریٹ اس'),
                        titlePadding: EdgeInsets.only(top: 5, left: 110),
                        content: Rate(
                          allowHalf: true,
                          iconSize: 30,
                          color: Colors.blue,
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('ریٹ اس'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('مسنوخ کریں'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.blue,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                'ریٹ اس',
                                style: GoogleFonts.notoNastaliqUrdu(
                                  textStyle: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.star,
                                color: Colors.blue,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    Aboutdev(),
                  );
                },
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.blue,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                'ابوٹ ڈویلپر',
                                style: GoogleFonts.notoNastaliqUrdu(
                                  textStyle: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.person,
                                color: Colors.blue,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: FirebaseAuth.instance.currentUser != null
                  ? GestureDetector(
                      onTap: () {
                        Get.to(
                          loggout(context),
                        );
                      },
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.blue,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      'لاگ آوٹ',
                                      style: GoogleFonts.notoNastaliqUrdu(
                                        textStyle: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.logout,
                                      color: Colors.blue,
                                      size: 32,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 0,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loggout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Sign_In()));
  }
}
