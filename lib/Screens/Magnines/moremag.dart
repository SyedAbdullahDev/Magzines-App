// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moharak/Screens/Account/user.dart';
import 'package:moharak/Screens/Magnines/Description.dart';
import 'package:moharak/Screens/SignIn/signIn.dart';
import 'package:moharak/Widgets/nav_bar.dart';

class MagazinesMore extends StatefulWidget {
  MagazinesMore({
    Key? key,
  }) : super(key: key);

  @override
  State<MagazinesMore> createState() => _MagazinesMoreState();
}

class _MagazinesMoreState extends State<MagazinesMore> {
  // ignore: unused_field
  final CollectionReference _magazines =
      FirebaseFirestore.instance.collection('magazines');
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        bottomNavigationBar: const Custom_bottombar(),
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
      backgroundColor: Colors.grey.shade300,
      body: StreamBuilder(
        stream: _magazines.orderBy('date', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return GridView.builder(
              
                padding: const EdgeInsets.only(top: 15),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 3 / 5,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (BuildContext ctx, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 220,
                            width: 155,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Description(
                                          read: documentSnapshot['file'],
                                          preview: documentSnapshot['preview'],
                                              image:
                                                  documentSnapshot['thumbnail'],
                                              date: documentSnapshot['date'],
                                              title: documentSnapshot['title'],
                                            )));
                              },
                              child: Image.network(
                                documentSnapshot['thumbnail'],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text(
                            documentSnapshot['title'],
                            textDirection: TextDirection.rtl,
                            style: GoogleFonts.notoNastaliqUrdu(),
                          ),
                          Text(
                            documentSnapshot['date'],
                            textDirection: TextDirection.rtl,
                            style: GoogleFonts.notoNastaliqUrdu(),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.blue,
          ));
        },
      ),
    );
  }
}
