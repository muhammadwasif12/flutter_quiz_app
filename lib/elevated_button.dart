import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton({super.key, required this.answerText, required this.onTap});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(260),
              shadowColor: Colors.purple,
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13))),
              padding: EdgeInsets.all(12),
              foregroundColor: Colors.white),
          child: Text(
            answerText,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 6,
        )
      ],
    );
  }
}
