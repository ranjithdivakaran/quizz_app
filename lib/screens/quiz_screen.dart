import 'package:flutter/material.dart';
import 'package:quizz_app/models/questions.dart';
import 'package:quizz_app/screens/result_screen.dart';
import 'package:quizz_app/widgets/answer_card.dart';
import 'package:quizz_app/widgets/next_button.dart';

class Quizscreen extends StatefulWidget {
  const Quizscreen({super.key});

  @override
  State<Quizscreen> createState() => _QuizscreenState();
}

class _QuizscreenState extends State<Quizscreen> {
  int? selectedanswerindex;
  int questionindex = 0;
  int score = 0;

  void pickanswer(int value) {
    selectedanswerindex = value;
    final question = questions[questionindex];
    if (selectedanswerindex == question.correctanswerindex) {
      score++;
    }
    setState(() {});
  }

  void gotonextquestion() {
    if (questionindex < questions.length - 1) {
      questionindex++;
      selectedanswerindex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionindex];
    bool islastquestion = questionindex == questions.length - 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              question.question,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: selectedanswerindex == null
                      ? () => pickanswer(index)
                      : null,
                  child: Answercard(
                    question: question.options[index],
                    isSelected: selectedanswerindex == index,
                    currentIndex: index,
                    correctAnswerIndex: question.correctanswerindex,
                    selectedAnswerIndex: selectedanswerindex,
                  ),
                );
              },
            ),
            //next button
            islastquestion
                ? NextButton(
                    onpressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => Resultscreen(score: score,),
                        ),
                      );
                    },
                    label: 'Finish')
                : NextButton(
                    onpressed:
                        selectedanswerindex != null ? gotonextquestion : null,
                    label: 'Next'),
          ],
        ),
      ),
    );
  }
}
