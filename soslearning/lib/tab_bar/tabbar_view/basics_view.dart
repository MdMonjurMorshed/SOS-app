import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soslearning/bloc/basic_bloc/bloc/basic_bloc.dart';
import 'package:soslearning/bloc/bloc/course_bloc.dart';
import 'package:soslearning/bloc/thumbnail/bloc/thumbnail_bloc.dart';
import 'package:soslearning/data_repositories/video_repo.dart';
import 'package:soslearning/models/video_model.dart';
import 'package:soslearning/themes/theme.dart';
import 'package:soslearning/video_view/video_player.dart';
import 'package:soslearning/views/submodview.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BasicView extends StatelessWidget {
  BasicView({Key? key, required this.color, required this.testApiList})
      : super(key: key);
  List<VideoModel> testApiList;
  final Color color;
  int chapter = 1;
  int video = 0;
  int suggestion = 0;
  double countsizeboxheight = 15;
  final basic1 = TextStyle(
    fontSize: 15,
    color: AppTheme.color.tabcolor1,
  );
  final basic2 = TextStyle(
    fontSize: 20,
    color: AppTheme.color.tabcolor1,
  );

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: false, children: [
      SizedBox(
        height: countsizeboxheight,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text(
                    "${testApiList.length}",
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
                    "${testApiList.length}",
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
              '${testApiList.length} videos',
              style: basic2,
            )
          ],
        ),
      ),
      Container(
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            itemExtent: MediaQuery.of(context).size.width / 1.5,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: testApiList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return VidPlayer(
                        vidId: YoutubePlayer.convertUrlToId(
                            testApiList[index].url)!);
                  }));
                },
                child: Card(
                    child: Image.network(
                  'https://img.youtube.com/vi/${YoutubePlayer.convertUrlToId(testApiList[index].url)}/0.jpg',
                  fit: BoxFit.cover,
                )),
              );
              //   child: Text(basicRipo[index].title),
              //   // child: Image.network(
              //   //     'https://img.youtube.com/vi/${YoutubePlayer.convertUrlToId(newlist[index].url)}/0.jpg'),
              // );
            },
          ))
    ]);
  }
}
