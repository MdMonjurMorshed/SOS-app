import 'package:flutter/material.dart';

class View1 extends StatelessWidget {
  const View1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text('এই মাসে আমার অবস্থা '),
      ),
    );
  }
}
