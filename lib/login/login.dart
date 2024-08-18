import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animate_do/animate_do.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:philips/HopitalScreens/MainScreen.dart';

import '../ApiServices/ApiService.dart';
import '../Home/HomePage.dart';
import '../Classes/Hospital.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  late Future<Hospital> hospitalCredentials;
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.blueAccent.shade200,
                //Colors.blueAccent.shade200,
                // Colors.blueAccent.shade200,
                Color.fromARGB(255, 122, 55, 226),
                Color.fromARGB(255, 122, 55, 226)
                // Color.fromRGBO(219, 112, 147, 1),
                // Color.fromRGBO(219, 112, 147, 1),
                //Colors.blue.shade700,
                //Colors.blue.shade700,
                //Colors.blue.shade700
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        FadeInUp(
                          duration: Duration(milliseconds: 1000),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                        SizedBox(width: 120),
                        FadeInUp(
                          duration: Duration(milliseconds: 1000),
                          child: Container(
                            width: 90,
                            height: 90,
                            child: Image.asset(
                              'assets/loginPageAssets/PhillipsLogo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    FadeInUp(
                      duration: Duration(milliseconds: 1300),
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 40),
                        FadeInUp(
                          duration: Duration(milliseconds: 1400),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextField(
                                    controller: emailField,
                                    decoration: InputDecoration(
                                      filled: true,
                                      hintText: "Email or Phone number",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextField(
                                    controller: passwordField,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        FadeInUp(
                          duration: Duration(milliseconds: 1500),
                          child: TextButton(
                            onPressed: () {

                              Fluttertoast.showToast(
                                  msg: "We can't do anything if you forgot Password",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            },
                            child: Text('Forgot Password??'),
                          ),
                        ),
                        SizedBox(height: 30),
                        FadeInUp(
                          duration: Duration(milliseconds: 1600),
                          child: MaterialButton(
                            onPressed: () async {
                              if ((emailField.text == "testphilips@gmail.com") &&
                                  (passwordField.text == "philips")) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const Mainscreen()));
                              } else if (emailField.text != null &&
                                  passwordField.text != null) {
                                print('else if block started');
                                // Calling the method with query parameters
                                Map<String, String> queryParams = {
                                  'name': emailField.text,
                                  'password': passwordField.text,
                                };
                                print('query parameter set');
                                Hospital hospitalCredentials =
                                await ApiService().getHospitalCredentials(
                                    queryParams: queryParams);
                                print('response came, hospital credentials = ');
                                print(hospitalCredentials);

                                if (hospitalCredentials.name ==
                                    emailField.text &&
                                    hospitalCredentials.password ==
                                        passwordField.text) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const Mainscreen()));
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg: "User not found",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                            height: 50,
                            color: Color.fromARGB(255, 122, 55, 226),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        FadeInUp(
                          duration: Duration(milliseconds: 1700),
                          child: Text(
                            "New Hospital?? HOLAA, Register with us!!",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FadeInUp(
                                duration: Duration(milliseconds: 1800),
                                child: MaterialButton(
                                  onPressed: () {
                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegistrationPage()));
                                  },
                                  height: 50,
                                  color: Color.fromARGB(255, 122, 55, 226),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "REGISTER",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
