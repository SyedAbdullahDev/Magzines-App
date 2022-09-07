// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moharak/Widgets/nav_bar.dart';

class quotescreen extends StatefulWidget {
  quotescreen({
    Key? key,
  }) : super(key: key);

  @override
  State<quotescreen> createState() => _quotescreenState();
}

class _quotescreenState extends State<quotescreen> {
  // ignore: unused_field
  final CollectionReference _qoutes =
      FirebaseFirestore.instance.collection('qoutes');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        backgroundColor: Colors.grey.shade300,
        body: StreamBuilder(
          stream: _qoutes
              .orderBy(
                'qoute',
                descending: true,
              )
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                          child: Stack(
                        alignment: Alignment.center,
                        textDirection: TextDirection.rtl,
                        children: [
                          Container(
                            color: Colors.black,
                            width: 400,
                            height: 300,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    documentSnapshot['qoute'],
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    style: GoogleFonts.notoNastaliqUrdu(
                                      textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(
                                          '\"${documentSnapshot['name']}\"',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: GoogleFonts.notoNastaliqUrdu(
                                            textStyle: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
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
                          ),
                        ],
                      )),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          },
        ),
      ),
    );
  }
}
