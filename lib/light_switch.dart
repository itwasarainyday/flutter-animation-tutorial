import 'package:flutter/material.dart';

class LightSwitch extends StatelessWidget {
  final Function(bool) onSwitched;

  LightSwitch({this.onSwitched});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(12),
        ),
        child: DefaultTabController(
          length: 2,
          child: TabBar(
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            onTap: (selectedIndex) {
              onSwitched(selectedIndex == 1);
            },
            tabs: [Tab(text: "Day"), Tab(text: "Night")],
          ),
        ),
      ),
    );
  }
}
