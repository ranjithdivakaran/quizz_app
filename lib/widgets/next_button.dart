import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback? onpressed;
  final String label;

  const NextButton({
    super.key,
    required this.onpressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Card(
          color: onpressed != null ? Colors.white24 : null,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
