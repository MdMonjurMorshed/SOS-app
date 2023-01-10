import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soslearning/bloc/basic_bloc/bloc/basic_bloc.dart';
import 'package:soslearning/bloc/thumbnail/bloc/thumbnail_bloc.dart';
import 'package:soslearning/data_repositories/video_repo.dart';
import 'package:soslearning/themes/theme.dart';

import 'submodview.dart';

class SubjectModule extends StatelessWidget {
  const SubjectModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: GridView.count(
          scrollDirection: Axis.horizontal,
          children: List.generate(choose.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return SubModView(
                    choic: choose[index],
                    urlString: api[index],
                    color: index % 2 == 0
                        ? AppTheme.color.SubIconColor1
                        : index % 3 == 1
                            ? AppTheme.color.SubIconColor3
                            : AppTheme.color.SubIconColor2,
                  );
                })));
                BlocProvider.of<BasicBloc>(context)
                    .add(BasicLoadedEvent(stringUrl: api[index]));
              },
              child: MakeGrid(
                cho: choose[index],
                color: index % 2 == 0
                    ? AppTheme.color.SubIconColor1
                    : index % 3 == 1
                        ? AppTheme.color.SubIconColor3
                        : AppTheme.color.SubIconColor2,
              ),
            );
          }),
          crossAxisCount: 3),
    );
  }
}

class choice {
  final String? title;
  final IconData? icon;

  choice({this.title, this.icon});
}

List<choice> choose = [
  choice(icon: Icons.home, title: "Physics"),
  choice(icon: Icons.home, title: "Mathematics"),
  choice(icon: Icons.home, title: "Chemistry"),
  choice(icon: Icons.home, title: "Electronics"),
  choice(icon: Icons.home, title: "Cvil"),
  choice(icon: Icons.home, title: "Java Programming"),
  choice(icon: Icons.home, title: "Bangla"),
  choice(icon: Icons.home, title: "English"),
  choice(icon: Icons.home, title: "Mechanical"),
];

List api = [
  "https://anotherapp12.herokuapp.com/vidapp/video/",
  "https://anotherapp12.herokuapp.com/vidapp/video/",
  "https://anotherapp12.herokuapp.com/vidapp/video/",
  "https://anotherapp12.herokuapp.com/vidapp/video/",
  "https://anotherapp12.herokuapp.com/vidapp/video/",
  "https://anotherapp12.herokuapp.com/vidapp/video/",
  "https://anotherapp12.herokuapp.com/vidapp/video/",
  "https://anotherapp12.herokuapp.com/vidapp/video/",
  "https://anotherapp12.herokuapp.com/vidapp/video/",
];

class MakeGrid extends StatelessWidget {
  const MakeGrid({Key? key, required this.cho, required this.color})
      : super(key: key);
  final choice cho;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
              radius: 50,
              backgroundColor: AppTheme.color.SubModCircleAvater,
              child: Icon(
                cho.icon,
                color: color,
                size: 100,
              )),
          Text(cho.title!)
        ],
      )),
    );
  }
}
