
import 'package:flutter/material.dart';
import 'package:quiz/constrants.dart';
import '../models/question_model.dart';
import '../widget/question_widget.dart';
import '../widget/next_button.dart';
import '../widget/result_box.dart';
import '../widget/options_card.dart';
import '../models/connect_db.dart';
import '../widget/timer.dart';
class QuizKimia extends StatefulWidget{
  const QuizKimia({Key? key}) :super(key: key);
  @override
  _QuizKimiaState createState() => _QuizKimiaState();
}

class _QuizKimiaState extends State<QuizKimia> with TickerProviderStateMixin{
  var db = DBconnect4();
  late AnimationController _controller;
  late Future _questions;


  Future<List<Question>> getData() async{
    return db.fetchQuestion();
  }
  @override

  void dispose() {
    // TODO: implement dispose
    if(_controller.isAnimating || _controller.isCompleted)
      _controller.dispose();
    super.dispose();

  }
  int limitTime = 600;


  void initState() {
    _questions = getData();
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds : limitTime));
    _controller.addListener(() {
      if(_controller.isCompleted){
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (ctx)=> ResultBox(
              result: score,
              questionLength:10,
              onPressed: startOver,
            ));
      }
    });
    _controller.forward();
  }
  int index = 0;
  int score=0;
  bool isPressed = false;
  bool isAlreadySelected = false;
  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      _controller.dispose();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx)=> ResultBox(
            result: score,
            questionLength:10,
            onPressed: startOver,
          ));
    }
    else {
      setState(() {
        index++;
        isPressed = false;
        isAlreadySelected = false;
      });
    }
  }
  void checkAnsweAndUpdate(bool value){
    if(isAlreadySelected){
      return;
    }else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });

    }
  }
  void startOver(){
    setState(() {
      index = 0;
      limitTime = 600;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
      _controller = AnimationController(vsync: this,duration: Duration(seconds : limitTime));

    });
    Navigator.pop(context);
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (ctx, snapshot){
        if(snapshot.connectionState== ConnectionState.done){
          if(snapshot.hasError){
            return Center(child: Text('${snapshot.error}'),);

          }else if(snapshot.hasData){
            var extractedData = snapshot.data as List<Question>;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Kimia',style: TextStyle(color: Colors.black),),
                centerTitle: true,
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      'Score: $score',
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black
                      ),
                    ),
                  )
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Timer(animation: StepTween(
                        begin : limitTime, end: 0).animate(_controller),),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                              width: double.infinity,
                              child: Text('Soal ${index+1}', style: TextStyle(fontSize: 20),)),
                          Container(
                            child: QuestionWidget(
                                indexAction: index,
                                question: extractedData[index].title,
                                totalQuestions:  extractedData.length),
                          ),

                          const SizedBox(height: 50,),
                          for(int i = 0; i < extractedData[index].options.length;i++)
                            Container(
                              child: GestureDetector(
                                onTap: () =>checkAnsweAndUpdate(
                                    extractedData[index].options.values.toList()[i]),
                                child: OptionCard(
                                  option:  extractedData[index].options.keys.toList()[i],
                                  color: isPressed ? extractedData[index].options.values.toList()[i] == true ? correct : incorrect : neutral,
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),

                  // Container(
                  //     padding: EdgeInsets.only(bottom: 30, top: 30),
                  //     child: Text('Matematika', style: TextStyle(fontSize: 20),))
                ],
              ),
              floatingActionButton:  GestureDetector(onTap: ()=> nextQuestion(extractedData.length), child: NextButton()),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            );
          }
        }
        else{
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const[
                  CircularProgressIndicator(),
                  SizedBox(height: 25,),
                  Text('Soal Sedang Disiapkan, Harap Tunggu...',
                    style: TextStyle(
                        color: Colors.white70,
                        decoration: TextDecoration.none,
                        fontSize: 18
                    ),)
                ],
              ));
        }
        return const Center(child: Text('no data'),);
      },
    );
  }
}