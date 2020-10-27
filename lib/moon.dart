import 'package:flutter/material.dart';

class Moon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 270,
          height: 270,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Colors.transparent,
                Colors.white12,
              ],
            ),
          ),
        ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Colors.transparent,
                Colors.white12,
              ],
            ),
          ),
        ),
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Colors.transparent,
                Colors.white12,
              ],
            ),
          ),
        ),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment(-0.5, -1.0),
              end: Alignment(0.8, 1.4),
              colors: [
                Color(0xFFA8CDF7),
                Color(0xFF6B9ACF),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
