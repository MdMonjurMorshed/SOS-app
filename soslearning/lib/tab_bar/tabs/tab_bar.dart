import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  TabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.green),
        child: Center(
          child: TabBar(
              indicatorColor: Colors.amber,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(20)),
              tabs: [
                Center(child: Text('Basic')),
                Center(child: Text('Primium')),
                Center(child: Text('Diamond')),
              ]),
        ),
      ),
    );
  }
}
