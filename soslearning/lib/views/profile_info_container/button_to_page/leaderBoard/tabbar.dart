import 'package:flutter/material.dart';

class LeaderTab extends StatelessWidget {
  LeaderTab({Key? key, this.controller}) : super(key: key);

  TabController? controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: TabBar(
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.white,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          indicator: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          indicatorSize: TabBarIndicatorSize.tab,
          controller: controller,
          tabs: [
            Row(
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: Colors.orange,
                ),
                Text('This Month')
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: Colors.orange,
                ),
                Text('All Time')
              ],
            )
          ],
        ),
        height: 50,
        width: MediaQuery.of(context).size.width / 1.04,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
