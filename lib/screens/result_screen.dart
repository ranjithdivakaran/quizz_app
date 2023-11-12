import 'package:flutter/material.dart';
import 'package:quizz_app/models/questions.dart';

class Resultscreen extends StatelessWidget {
  final int score;

  const Resultscreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 1000,),
          Text('your score:',
            style: TextStyle(fontSize: 34,
              fontWeight: FontWeight.w500,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: score/9,
                  color: Colors.green,
                  backgroundColor: Colors.white,
                ),
              ),
              Column(
                children: [
                  Text(score.toString(),style: TextStyle(fontSize: 80),),
                  SizedBox(height: 10,),
                  Text(
                    '${(score/questions.length*100).round()}%',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
