import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final Widget wid;
  const DrawerButton({Key? key, required this.wid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: wid,
        )
      ],
    );
  }
}
