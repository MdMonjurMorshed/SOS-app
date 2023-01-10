import 'package:flutter/material.dart';
import 'package:soslearning/views/profile_info_container/button_to_page/leaderBoard/tabbar.dart';
import 'package:soslearning/views/profile_info_container/button_to_page/leaderBoard/tabbar_view1.dart';
import 'package:soslearning/views/profile_info_container/button_to_page/leaderBoard/tabbar_view2.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Leader Board',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            LeaderTab(
              controller: tabController,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: TabBarView(
                    controller: tabController, children: [View1(), View2()]))
          ],
        ),
      ),
    );
  }
}
