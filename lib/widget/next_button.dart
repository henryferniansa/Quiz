import 'package:flutter/material.dart';
import 'package:quiz/constrants.dart';
class NextButton extends StatelessWidget{
 const NextButton({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color : neutral,
        border: Border.all(),
        borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: const Text('Next',
        textAlign: TextAlign.center,
      ),
    );
  }
}