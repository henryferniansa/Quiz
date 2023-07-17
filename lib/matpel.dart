
import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz_bio.dart';
import 'package:quiz/screens/quiz_fisika.dart';
import 'package:quiz/screens/quiz_kimia.dart';
import 'package:quiz/screens/quiz_mtk.dart';


class MataPelajaran extends StatelessWidget{
  const MataPelajaran({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu',
            style: TextStyle(
              fontSize: 30,
              color: Color(0xff798777),
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body:
        Column(

          children: [
            GridView.count(
              primary: false,
              padding: const EdgeInsets.only(right: 30, left: 30, bottom: 30, top : 50),
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              shrinkWrap: true,
              children: <Widget>[
                TextButton(
                  child: Container(

                      padding: const EdgeInsets.all(0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Image.asset('assets/images/matematika.png',
                              height: 125,
                              width: 125,
                            ),
                            const Text('Matematika',
                                style : TextStyle(
                                    fontSize: 16,
                                  color: Colors.black
                                )),
                          ]
                      )
                  ),
                  onPressed: (){ Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizMtk()),
                  ); },
                ),
                TextButton(
                  child: Container(
                      padding: const EdgeInsets.all(0),
                      color: Colors.transparent,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Image.asset('assets/images/biologi.png',
                              height: 125,
                              width: 125,
                            ),
                            const Text('Biologi',
                                style : TextStyle(
                                    fontSize: 16,
                                    color: Colors.black
                                )),
                          ]
                      )
                  ),
                  onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizBio()),
                  ); },
                ),
                TextButton(
                  child: Container(
                      padding: const EdgeInsets.all(0),
                      color: Colors.transparent,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Image.asset('assets/images/fisika.png',
                              height: 125,
                              width: 125,
                            ),
                            const Text('Fisika',
                                style : TextStyle(
                                    fontSize: 16,
                                    color: Colors.black
                                )),
                          ]
                      )
                  ),
                  onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizFisika()),
                  ); },
                ),
                TextButton(
                  child: Container(
                      padding: const EdgeInsets.all(0),
                      color: Colors.transparent,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Image.asset('assets/images/kimia.png',
                              height: 125,
                              width: 125,
                            ),
                            const Text('Kimia',
                                style : TextStyle(
                                    fontSize: 16,
                                    color: Colors.black
                                )),
                          ]
                      )
                  ),
                  onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizKimia()),
                  ); },

                ),
              ],
            ),
            Container(
              width: 200,
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Pilih Mata Pelajaran',
                      style: TextStyle(
                        fontSize: 35,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )

        );
  }
}