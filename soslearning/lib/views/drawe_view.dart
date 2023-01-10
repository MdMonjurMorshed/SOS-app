import 'package:flutter/material.dart';
import 'package:soslearning/views/drawer_items/Profile.dart';
import 'package:soslearning/views/drawer_items/drawer_footer.dart';
import 'package:soslearning/views/drawer_items/drawerlistview.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          child: DrawerProfile(),
          height: MediaQuery.of(context).size.height / 3.6,
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height / 1.675,
            child: DrawerList(),
          ),
        ),
        Container(
          child: DrawerFooter(),
          height: MediaQuery.of(context).size.height / 10,
          width: double.maxFinite,
        ),
      ],
    ));
  }
}
