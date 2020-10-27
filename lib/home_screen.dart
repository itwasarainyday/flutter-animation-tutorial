import 'package:flutter/material.dart';
import 'package:flutter_animation_lbd/light_switch.dart';
import 'package:flutter_animation_lbd/moon.dart';
import 'package:flutter_animation_lbd/sun.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDayTime = true;
  bool isSunUp = true;

  List<Color> getBackgroundGradient() {
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
          onSwitched: (isOn) {
            setState(() {
              isDayTime = !isOn;
            });
            Future.delayed(Duration(milliseconds: 200), () {
              setState(() {
                isSunUp = !isOn;
              });
            });
          },
        ),
        SizedBox(height: 20),
        Center(
          child: Text(
            isDayTime ? "Good Morning!" : "Good Evening!",
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
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: getBackgroundGradient(),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            bottom: isSunUp ? 150 : -300,
            child: Sun(),
          ),
          AnimatedPositioned(
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            bottom: !isSunUp ? 150 : -300,
            child: Moon(),
          ),
        ],
      ),
    );
  }
}
