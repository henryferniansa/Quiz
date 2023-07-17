import 'package:http/http.dart' as http;
import 'question_model.dart';
import 'dart:convert';
class DBconnect{
  final url = Uri.parse('https://quiz-apps-77a13-default-rtdb.asia-southeast1.firebasedatabase.app/question.json');
  // Future<void> addQuestion(Question question) async{
  //   http.post(url, body: json.encode({
  //     'title' : question.title,
  //     'options' : question.options,
  //   }));
  // }
 
  Future<List<Question>> fetchQuestion()async{
   return http.get(url).then((response){
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach((key, value) { 
        var newQuestion = Question(
          id: key,
          title : value['title'],
          options : Map.castFrom(value['options']),
          );

          newQuestions.add(newQuestion);

      });
      return newQuestions;
    });
  }
}

class DBconnect2{
  final url = Uri.parse('https://quiz-apps-77a13-default-rtdb.asia-southeast1.firebasedatabase.app/question2.json');
  // Future<void> addQuestion(Question question) async{
  //   http.post(url, body: json.encode({
  //     'title' : question.title,
  //     'options' : question.options,
  //   }));
  // }
 
  Future<List<Question>> fetchQuestion()async{
   return http.get(url).then((response){
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];

      data.forEach((key, value) { 
        var newQuestion = Question(
          id: key,
          title : value['title'],
          options : Map.castFrom(value['options']),
          );

          newQuestions.add(newQuestion);

      });
      return newQuestions;
    });
  }
}

class DBconnect3{
  final url = Uri.parse('https://quiz-apps-77a13-default-rtdb.asia-southeast1.firebasedatabase.app/question3.json');
  // Future<void> addQuestion(Question question) async{
  //   http.post(url, body: json.encode({
  //     'title' : question.title,
  //     'options' : question.options,
  //   }));
  // }
 
  Future<List<Question>> fetchQuestion()async{
   return http.get(url).then((response){
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach((key, value) { 
        var newQuestion = Question(
          id: key,
          title : value['title'],
          options : Map.castFrom(value['options']),
          );

          newQuestions.add(newQuestion);

      });
      return newQuestions;
    });
  }
}

class DBconnect4{
  final url = Uri.parse('https://quiz-apps-77a13-default-rtdb.asia-southeast1.firebasedatabase.app/question4.json');
  // Future<void> addQuestion(Question question) async{
  //   http.post(url, body: json.encode({
  //     'title' : question.title,
  //     'options' : question.options,
  //   }));
  // }
 
  Future<List<Question>> fetchQuestion()async{
   return http.get(url).then((response){
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach((key, value) { 
        var newQuestion = Question(
          id: key,
          title : value['title'],
          options : Map.castFrom(value['options']),
          );

          newQuestions.add(newQuestion);

      });
      return newQuestions;
    });
  }
}
