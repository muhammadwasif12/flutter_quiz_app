import 'package:flutter/material.dart';

//Custom Widget :
class Gradient_Container extends StatelessWidget {
  Gradient_Container(this.color1, this.color2, {super.key});
  //constructor is used for flexibility by user provide values in custom during calling custom widget.
  final color1; //this keyword is used for same colors variables
  final color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [color1, color2],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        //Alignment.center,
      )),
    );
  }
}
