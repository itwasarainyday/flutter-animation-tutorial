import 'package:flutter/material.dart';
import 'package:flutter_animation_lbd/light_switch.dart';
import 'package:flutter_animation_lbd/sun.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDayTime = true;
  bool isSunUp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildHeader(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 80),
        LightSwitch(
          onSwitched: (isOn) {},
        ),
        SizedBox(height: 20),
        Center(
          child: Text(
            "Good Morning!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: _getBackgroundGradient(),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 150,
            child: Sun(),
          ),
        ],
      ),
    );
  }

  List<Color> _getBackgroundGradient() {
    if (isDayTime) {
      return [
        Color(0xFF8C2480),
        Color(0xFFCE587D),
        Color(0xFFFF9485),
        if (isSunUp) Color(0xFFFF9D80),
      ];
    } else {
      return [
        Color(0xFF0D1441),
        Color(0xFF283584),
        Color(0xFF376AB2),
      ];
    }
  }
}
