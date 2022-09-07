// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moharak/Screens/Account/user.dart';
import 'package:moharak/Screens/Blogs/blogdesc.dart';
import 'package:moharak/Screens/SignIn/signIn.dart';
import 'package:moharak/Widgets/nav_bar.dart';

class Article_Screen extends StatefulWidget {
  const Article_Screen({
    Key? key,
  }) : super(key: key);

  @override
  State<Article_Screen> createState() => _Article_ScreenState();
}

class _Article_ScreenState extends State<Article_Screen> {
  final CollectionReference _blog =
      FirebaseFirestore.instance.collection('blogs');

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
        stream: _blog.orderBy("date", descending: true).snapshots(),
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description_Screen(
                            image: documentSnapshot['thumbnail'],
                            title: documentSnapshot['title'],
                            description: documentSnapshot['link'],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        textDirection: TextDirection.rtl,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width - 30,
                            child: FancyShimmerImage(
                              boxFit: BoxFit.cover,
                              errorWidget: Image.network(
                                  'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                              imageUrl: documentSnapshot['thumbnail'],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Text(documentSnapshot['title'],
                                textDirection: TextDirection.rtl,
                                style: GoogleFonts.notoNastaliqUrdu(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
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
    );
  }
}
