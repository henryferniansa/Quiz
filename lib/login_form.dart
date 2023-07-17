import 'package:flutter/material.dart';

import 'matpel.dart';
// import 'main.dart';
// import 'home.dart';
class LoginForm extends StatefulWidget{
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  get isEmpty => null;

  @override
  Widget build(BuildContext context){
  return GestureDetector(
    onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8EDE3),
        elevation: 0,
        title: const Text(
          "Login",
          style: TextStyle(
            fontSize: 40,
            color: Color(0xff798777),

          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: Image.asset('assets/images/login_bg.png',
            ),
          ),
          Column(
            children: [
              Container(
                width: 245,
                height: 60,
                margin: const EdgeInsets.only(top: 60, ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
                ),
                child:TextFormField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding:
                      EdgeInsets.only(left: 15,bottom: 0,top:11,right: 15),
                      hintText: 'Nama'
                  ),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,

                ),

              ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: 245,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                child:TextFormField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding:
                      EdgeInsets.only(left: 15,bottom: 0,top:11,right: 15),
                      hintText: 'NIM',


                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20
                  ),


                ),
              )
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Color(0xff798777)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    minimumSize: const MaterialStatePropertyAll(Size(245, 60))
                  ),
                  onPressed: ()
                  { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MataPelajaran()),
                  ); },
                  child: const Text('Submit',
                  style: TextStyle(
                    fontSize: 30
                  ),)
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}