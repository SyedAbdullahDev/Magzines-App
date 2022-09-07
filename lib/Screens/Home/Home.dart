// ignore_for_file: file_names
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moharak/Screens/Account/user.dart';
import 'package:moharak/Screens/Blogs/blogdesc.dart';
import 'package:moharak/Screens/Blogs/blogmore.dart';
import 'package:moharak/Screens/Magnines/Description.dart';
import 'package:moharak/Screens/Magnines/moremag.dart';
import 'package:moharak/Screens/Quotes/quotes.dart';
import 'package:moharak/Screens/Quotes/viewmore.dart';
import 'package:moharak/Screens/SignIn/signIn.dart';
import 'package:moharak/Screens/Videos/morevidio.dart';
import 'package:moharak/Screens/Videos/playvidio.dart';
import 'package:moharak/Widgets/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference _vid =
      FirebaseFirestore.instance.collection('videos');
  final CollectionReference _qoutes =
      FirebaseFirestore.instance.collection('qoutes');
  final CollectionReference _magazines =
      FirebaseFirestore.instance.collection('magazines');

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CarouselSlider(
                items: [
                  Container(
                    height: 600,
                    width: 550,
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.asset(
                      "assets/2.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 600,
                    width: 550,
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.asset(
                      "assets/4.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 600,
                    width: 550,
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.asset(
                      "assets/3.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 230.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 900),
                  viewportFraction: 0.9,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    "کرنٹ ایشوز",
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.notoNastaliqUrdu(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MagazinesMore()));
                    },
                    child: Text(
                      "مزید دیکھیں",
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.notoNastaliqUrdu(
                          fontSize: 15, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                StreamBuilder(
                  stream: _magazines.orderBy('date', descending: true).snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return GridView.builder(
                          physics: ScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 300,
                                  childAspectRatio: 3 / 5,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 0),
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 8, bottom: 0),
                          itemCount: 2,
                          itemBuilder: (BuildContext ctx, index) {
                            final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 220,
                                    width: 155,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(Description(
                                          read: documentSnapshot['file'],
                                          preview: documentSnapshot['preview'],
                                          image: documentSnapshot['thumbnail'],
                                          date: documentSnapshot['date'],
                                          title: documentSnapshot['title'],
                                        ));
                                      },
                                      child: FancyShimmerImage(
                                        boxFit: BoxFit.cover,
                                        errorWidget: Image.network(
                                            'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                                        imageUrl: documentSnapshot['thumbnail'],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    documentSnapshot['title'],
                                    textDirection: TextDirection.rtl,
                                    style: GoogleFonts.notoNastaliqUrdu(),
                                  ),
                                ],
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    "مشہور",
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.notoNastaliqUrdu(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder(
              stream: _magazines.orderBy('date', descending: true).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return GridView.builder(
                      physics: ScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              childAspectRatio: 3 / 5,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 8),
                      itemCount: 2,
                      itemBuilder: (BuildContext ctx, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 220,
                                width: 155,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(Description(
                                      read: documentSnapshot['file'],
                                      preview: documentSnapshot['preview'],
                                      image: documentSnapshot['thumbnail'],
                                      date: documentSnapshot['date'],
                                      title: documentSnapshot['title'],
                                    ));
                                  },
                                  child: FancyShimmerImage(
                                    boxFit: BoxFit.cover,
                                    errorWidget: Image.network(
                                        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                                    imageUrl: documentSnapshot['thumbnail'],
                                  ),
                                ),
                              ),
                              Text(
                                documentSnapshot['title'],
                                textDirection: TextDirection.rtl,
                                style: GoogleFonts.notoNastaliqUrdu(),
                              ),
                            ],
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    "کرنٹ آرٹیکلز",
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.notoNastaliqUrdu(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Article_Screen()));
                    },
                    child: Text(
                      "مزید دیکھیں",
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.notoNastaliqUrdu(
                          fontSize: 15, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder(
              stream: _blog.orderBy("date", descending: true).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(
                              Description_Screen(
                                image: documentSnapshot['thumbnail'],
                                title: documentSnapshot['title'],
                                description: documentSnapshot['link'],
                              ),
                            );
                          },
                          child: Card(
                            elevation: 7,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                height: 240,
                                width: 280,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    FancyShimmerImage(
                                      width: 250,
                                      height: 150,
                                      boxFit: BoxFit.cover,
                                      errorWidget: Image.network(
                                          'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                                      imageUrl: documentSnapshot['thumbnail'],
                                    ),
                                    Text(
                                      documentSnapshot['date'],
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue),
                                      ),
                                    ),
                                    Text(
                                      documentSnapshot['title'],
                                      style: GoogleFonts.notoNastaliqUrdu(
                                        textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    "اقتباس",
                    style: GoogleFonts.notoNastaliqUrdu(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(quotescreen());
                    },
                    child: Text(
                      "مزید دیکھیں",
                      style: GoogleFonts.notoNastaliqUrdu(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder(
              stream: _qoutes
                  .orderBy(
                    'date',
                    descending: true,
                  )
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    physics: ScrollPhysics(),
                    
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                      return InkWell(
                        onTap: () {
                          Get.to(
                            viewmoreq(
                              qote: documentSnapshot['qoute'],
                              name: documentSnapshot['name'],
                            ),
                          );
                        },
                        child: Card(
                          child: Container(
                            color: Colors.black,
                            height: 190,
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  documentSnapshot['qoute'],
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
                              ),
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
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    "ویڈیوز",
                    style: GoogleFonts.notoNastaliqUrdu(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VidioScreen()));
                    },
                    child: Text(
                      "مزید دیکھیں",
                      style: GoogleFonts.notoNastaliqUrdu(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder(
              stream: _vid.orderBy('date', descending: true).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(
                              VideoPlayerItem(
                                videoUrl: documentSnapshot['file'],
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
                                  width: MediaQuery.of(context).size.width - 38,
                                  child: FancyShimmerImage(
                                    boxFit: BoxFit.cover,
                                    errorWidget: Image.network(
                                        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                                    imageUrl: documentSnapshot['thumbnail'],
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 10),
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(documentSnapshot['title'],
                                      textDirection: TextDirection.rtl,
                                      style: GoogleFonts.notoNastaliqUrdu(
                                        fontSize: 15,
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
          ],
        ),
      ),
    );
  }
}
