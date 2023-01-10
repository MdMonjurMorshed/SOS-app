import 'package:flutter/material.dart';
import 'package:soslearning/themes/theme.dart';

class DiamondVoew extends StatelessWidget {
  DiamondVoew({
    Key? key,
  }) : super(key: key);

  int? chapter = 1;
  int? video = 0;
  int? suggestion = 0;
  double countsizeboxheight = 15;
  final basic1 = TextStyle(
    fontSize: 15,
    color: AppTheme.color.tabcolor3,
  );
  final basic2 = TextStyle(
    fontSize: 20,
    color: AppTheme.color.tabcolor3,
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          height: countsizeboxheight,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      "$chapter",
                      style: basic1,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Chapter',
                    )
                  ],
                ),
                VerticalDivider(
                  color: Colors.black87,
                  width: 1,
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "$video",
                      style: basic1,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Videos',
                    )
                  ],
                ),
                VerticalDivider(
                  color: Colors.black,
                  width: 1,
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "$suggestion",
                      style: basic1,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'suggestion book',
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "chapter name",
                style: basic2,
              ),
              Text(
                '${video} videos',
                style: basic2,
              )
            ],
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            itemExtent: MediaQuery.of(context).size.width / 1.5,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                child: Center(child: Text('video will be shown here')),
              );
            },
          ),
        )
      ],
    );
  }
}
