import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soslearning/themes/theme.dart';
import 'package:soslearning/views/course_details.dart';

import 'package:soslearning/views/drawe_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:soslearning/views/slider.dart';
import 'package:soslearning/views/view_more.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import '../logical_class/linkopen.dart';
import 'drawer_button.dart';
import 'option_button.dart';
import 'subject_module.dart';

class HomePage extends StatelessWidget {
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  List list = [
    'welcome...',
    'welcome to softmax',
    'softmax online school',
    'softmax...'
  ];
  ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      extendBody: true,
      extendBodyBehindAppBar: true,
      drawer: DrawerView(),
      body: ListView(
        controller: listScrollController,
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/bgImages/subpage_banner.png'),
                    fit: BoxFit.fill)),
            child: Wrap(
              children: [
                DrawerButton(
                    wid: FloatingActionButton(
                  backgroundColor: AppTheme.color.floatingButton,
                  onPressed: () {
                    _scaffoldkey.currentState!.openDrawer();
                  },
                  child: const Icon(Icons.menu),
                )),
                OptionButton(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Container(
              height: 120,
              width: double.infinity,
              child: ImgSlider(),
            ),
          ),
          SubjectModule(),

          // two text buttons called course_details and View_More

          SizedBox(
              height: 100,
              width: double.maxFinite,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CourseDetails();
                        }));
                      },
                      child: Text(
                        "Course Details",
                        style: AppTheme.text.text_but,
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ViewMore();
                        }));
                      },
                      child: Text(
                        "View More",
                        style: AppTheme.text.text_but,
                      )),
                ],
              )),

          // sized box is for normal gap

          SizedBox(
            height: 20,
          ),

          //this sizedbox is for the list view of horizontal scroll

          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 180,
                          child: Image.network(
                            'https://play-lh.googleusercontent.com/Bs7EBGZSpjxse_iTbFCz97OfKtpzejDrNtSKswRPCzhSesAsiph9VEUBOcFDcXoxYw',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          height: 90,
                          child: Center(
                            child: Text(list[index]),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),

          // for normal Gap

          SizedBox(
            height: 30,
          ),

          // header for recently learned

          SizedBox(
            height: 40,
            child: Text(
              'Recently Learned',
              style: AppTheme.text.header_text,
            ),
          ),

          // for recently learned list view

          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 180,
                          child: Image.network(
                            'https://play-lh.googleusercontent.com/Bs7EBGZSpjxse_iTbFCz97OfKtpzejDrNtSKswRPCzhSesAsiph9VEUBOcFDcXoxYw',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          height: 90,
                          child: Center(
                            child: Text(list[3]),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),

          // for normal gap

          SizedBox(
            height: 20,
          ),

          // header for the exam

          SizedBox(
            height: 40,
            child: Text(
              'Exam',
              style: AppTheme.text.header_text,
            ),
          ),

          // for three buttons model, quiz and mock

          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      'Model',
                      style: AppTheme.text.exam_but,
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: AppTheme.color.medel_lengradient),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 3.5,
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Quiz',
                      style: AppTheme.text.exam_but,
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: AppTheme.color.quiz_lengradient),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 3.5,
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Mock',
                      style: AppTheme.text.exam_but,
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: AppTheme.color.mock_lengradient),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 3.5,
                )
              ],
            ),
          ),

          //this is for normal gap

          SizedBox(
            height: 20,
          ),

          // this is for promotional header

          SizedBox(
            height: 40,
            child: Text(
              "Promotinal",
              style: AppTheme.text.header_text,
            ),
          ),

          //this is for promotional photo

          SizedBox(
            height: 200,
            child: Image.network(
              'https://i.ytimg.com/vi/F7Vz9Px4NC8/maxresdefault.jpg',
              fit: BoxFit.fill,
            ),
          ),

          //this is for normal gap

          SizedBox(
            height: 50,
          ),

          SizedBox(
            height: 40,
            child: Text(
              'Share the app',
              style: AppTheme.text.header_text,
            ),
          ),

          // this is for share_app button

          SizedBox(
              height: 100,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    Share.share(
                        'https://www.youtube.com/c/SoftmaxOnlineSchools');
                  },
                  child: Card(
                      child: Center(
                    child: ListTile(
                        leading: Icon(Icons.share_outlined),
                        title: Text('Share with friends'),
                        subtitle: Text(
                            'help your friend fall in love with the thought of softmax'),
                        trailing: Container(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                              color: AppTheme.color.share_but_right_arrow,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: AppTheme.color.medel_lengradient))),
                  )),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 8,
                          spreadRadius: .5)
                    ]),
              )),

          //this is for  normal gap

          SizedBox(
            height: 30,
          ),

          // this is for  Rate the app header

          SizedBox(
              height: 40,
              child: Text(
                'Rate the softmax',
                style: AppTheme.text.header_text,
              )),

          SizedBox(
            height: 20,
          ),

          SizedBox(
            height: 100,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: GestureDetector(
                onTap: (() => Utils.openLink(
                    url: 'https://www.youtube.com/c/SoftmaxOnlineSchools')),
                child: Card(
                    child: Center(
                  child: ListTile(
                      leading: Image.asset(
                        'assets/images/icons/rating.png',
                        height: 30,
                        width: 30,
                      ),
                      title: Text('Rate The App'),
                      subtitle: Row(
                        children: [
                          Image.asset(
                            'assets/images/icons/star.png',
                            height: 30,
                            width: 30,
                          ),
                          Image.asset(
                            'assets/images/icons/star.png',
                            height: 30,
                            width: 30,
                          ),
                          Image.asset(
                            'assets/images/icons/star.png',
                            height: 30,
                            width: 30,
                          ),
                          Image.asset(
                            'assets/images/icons/star.png',
                            height: 30,
                            width: 30,
                          ),
                          Image.asset(
                            'assets/images/icons/star.png',
                            height: 30,
                            width: 30,
                          ),
                        ],
                      ),
                      trailing: Container(
                          height: 30,
                          width: 30,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                            color: AppTheme.color.share_but_right_arrow,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: AppTheme.color.medel_lengradient))),
                )),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 8,
                        spreadRadius: .5)
                  ]),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
