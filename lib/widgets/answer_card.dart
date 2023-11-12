import 'package:flutter/material.dart';

class Answercard extends StatelessWidget {
  final String question;
  final bool isSelected;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;

  const Answercard({
    super.key,
    required this.question,
    required this.isSelected,
    required this.currentIndex,
    required this.correctAnswerIndex,
    required this.selectedAnswerIndex,
  });

  @override
  Widget build(BuildContext context) {
    bool iscorrectanswer = currentIndex == correctAnswerIndex;
    bool iswronganswer = !iscorrectanswer && isSelected;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: selectedAnswerIndex != null
          ? Container(
        height: 70,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: iscorrectanswer
                ? Colors.green
                : iswronganswer
                ? Colors.red
                : Colors.white24,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                question,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            iscorrectanswer
                ? buildCorrectIcon()
                : iswronganswer
                ? buildWrongIcon()
                : const SizedBox.shrink(),
          ],
        ),
      )
      //if no option is selected
          : Container(
        height: 70,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white24
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                question,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCorrectIcon() =>
      CircleAvatar(
        radius: 15,
        backgroundColor: Colors.green,
        child: Icon(Icons.check, color: Colors.white,),
      );


  Widget buildWrongIcon() =>
      CircleAvatar(
        radius: 15,
        backgroundColor: Colors.red,
        child: Icon(Icons.close, color: Colors.white,),
      );

}
