import 'package:flutter/material.dart';
import 'package:quiz/screens/login_screen.dart';
import 'login_form.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFF8EDE3),
            elevation: 0,
            title: const Text(
              "Quizzy",
              style: TextStyle(
                fontSize: 60,
                color: Color(0xff798777),

              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  width: 300,
                  height: 300,
                  child: SvgPicture.asset('assets/images/home.svg',
                    height: 200,
                    width: 200,
                  )
              ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 150),
                child: Column(
                  children: [
                    SizedBox(
                      width: 245,
                      height: 60,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF798777)),
                          elevation: MaterialStateProperty.all(10),
                          //Defines Elevation
                          shadowColor: MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          "Mulai",
                          style: TextStyle(fontSize: 32,
                            color: Colors.black,),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      width: 245,
                      height: 60,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF798777)),
                          elevation: MaterialStateProperty.all(10),
                          //Defines Elevation
                          shadowColor: MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),

                          ),
                          alignment: Alignment.center,
                        ),
                        // Within the `FirstRoute` widget
                        onPressed: () {

                        },
                        child: const Text(
                          "Keluar",
                          style: TextStyle(color: Colors.black,
                            fontSize: 32,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

          ),
    );
  }}