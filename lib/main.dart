import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz/home.dart';
import 'models/connect_db.dart';
import 'models/question_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var db = DBconnect();
  var db2 = DBconnect2();
  var db3 = DBconnect3();
  var db4 = DBconnect4();
  // db4.addQuestion(
  //     Question(
  //       id:'3',
  //     title : 'Apabila unsur-unsur disusun menurut kenaikan massa atom relatifnya, ternyata unsur yang ke-8 menunjukkan persamaan sifat dengan unsur yang ke-1, unsur yang ke-9 menunjukkan persamaan sifat dengan unsur yang ke-2 dan seterusnya. Pernyataan ini ditemukan oleh',
  //     options : {
  //       'Lothar Meyer' : false,
  //       'AR Newland' : true,
  //       'JW Dobereiner' : false,
  //       'Wilheim Rontgen' : false,

  //     }));
       
  db.fetchQuestion();
  db2.fetchQuestion();
  db3.fetchQuestion();
  db4.fetchQuestion();

    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8EDE3),

        fontFamily: 'Jua',
    ),
      home: const Home(),
    ));

}

