// ignore_for_file: camel_case_types, file_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moharak/Screens/Home/Home.dart';
import 'package:moharak/Screens/SignUp/signUp.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({Key? key}) : super(key: key);

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    //--------------------------------Email
    final emailFeild = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Email");
        }
        String pattern = r'\w+@\w+\.\w+';
        if (!RegExp(pattern).hasMatch(value)) {
          return 'Invalid Email format';
        }
        return null;
      },
      onSaved: (value) {
        emailcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    //------------------------------Password
    final passwordFeild = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordcontroller,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Enter Password");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Password(Min 6 character)");
        }
        return null;
      },
      onSaved: (value) {
        passwordcontroller.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    //--------------------------------Button
    final loginbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        splashColor: Colors.black,
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          if (emailcontroller.text.contains('admin@gmail.com') &&
              passwordcontroller.text.contains('iamadmin')) {
            print('Admin');
            Navigator.pushNamed(context, '/admin');
          } else {
            print('User');
            signIn(emailcontroller.text, passwordcontroller.text);
          }
        },
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/5.png",
                          width: 220,
                        )),
                    const SizedBox(
                      height: 25,
                    ),
                    emailFeild,
                    const SizedBox(
                      height: 25,
                    ),
                    passwordFeild,
                    const SizedBox(
                      height: 30,
                    ),
                    loginbutton,
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const Sign_Up(),
                              ),
                            );
                          },
                          child: const Text(
                            " Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                                fontSize: 15),
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
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
