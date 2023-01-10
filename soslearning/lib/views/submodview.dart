import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:soslearning/bloc/basic_bloc/bloc/basic_bloc.dart';
import 'package:soslearning/data_repositories/video_repo.dart';
import 'package:soslearning/models/video_model.dart';
import 'package:soslearning/tab_bar/tabbar_view/basics_view.dart';
import 'package:soslearning/tab_bar/tabbar_view/diamond_view.dart';
import 'package:soslearning/tab_bar/tabbar_view/primium_view.dart';
import 'package:soslearning/tab_bar/tabs/tab_bar.dart';
import 'package:soslearning/themes/theme.dart';
import 'package:soslearning/views/subject_module.dart';

class SubModView extends StatefulWidget {
  final choice choic;
  final Color color;
  final String urlString;
  SubModView(
      {Key? key,
      required this.choic,
      required this.color,
      required this.urlString})
      : super(key: key);

  @override
  State<SubModView> createState() =>
      _SubModViewState(col: color, stateUrlString: urlString);
}

class _SubModViewState extends State<SubModView>
    with SingleTickerProviderStateMixin {
  final Color? col;
  final String stateUrlString;

  _SubModViewState({this.col, required this.stateUrlString});
  var colValue = AppTheme.color.tabcolor1;
  TabController? _controller;
  late Future<List<TestApi>> futureVidData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // course names

            SizedBox(
                height: 100,
                child: Stack(
                  children: [
                    Positioned(
                        top: 50,
                        right: MediaQuery.of(context).size.width - 70,
                        child: Container(
                          height: 45,
                          width: 45,
                          child: FloatingActionButton(
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: AppTheme.color.backicon,
                              ),
                              backgroundColor: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Center(
                          child: Text(
                        "${widget.choic.title}",
                        style: TextStyle(
                            color: col,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ],
                )),

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: colValue, borderRadius: BorderRadius.circular(20)),
                height: 40,
                child: TabBar(
                  onTap: (int value) {
                    setState(() {
                      switch (value) {
                        case 0:
                          colValue = AppTheme.color.tabcolor1;

                          break;
                        case 1:
                          colValue = AppTheme.color.tabcolor2;
                          break;
                        case 2:
                          colValue = AppTheme.color.tabcolor3;
                          break;
                        default:
                      }
                    });
                  },
                  unselectedLabelColor: Colors.white,
                  labelColor: colValue,
                  indicatorPadding: EdgeInsets.all(5),
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  controller: _controller,
                  tabs: [
                    Tab(
                      child: Row(children: [
                        Icon(
                          Icons.check_circle_rounded,
                          color: colValue,
                        ),
                        Text('Basic')
                      ]),
                    ),
                    Tab(
                      child: Row(children: [
                        Icon(
                          Icons.check_circle_rounded,
                          color: colValue,
                        ),
                        Text('Primium')
                      ]),
                    ),
                    Tab(
                      child: Row(children: [
                        Icon(
                          Icons.check_circle_rounded,
                          color: colValue,
                        ),
                        Text('Diamond')
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height - 300,
                width: double.maxFinite,
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _controller,
                    children: [
                      BlocBuilder<BasicBloc, BasicState>(
                          builder: (context, state) {
                        if (state is BasicLoadedError) {
                          return CircularProgressIndicator();
                        }
                        if (state is BasicLoadedState) {
                          return BasicView(
                              testApiList: state.listVideo, color: col!);
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                      PrimiumView(
                        color: col!,
                      ),
                      DiamondVoew()
                    ])),
          ],
        ),
      ),
    );
  }
}

class VidData {
  String? title;
  String? url;
  VidData({required this.title, required this.url});

  factory VidData.fromJson(Map<String, dynamic> json) {
    return VidData(title: json['title'], url: json['url']);
  }
}

class TestApi {
  int userId;
  int id;
  String title;
  String body;
  TestApi(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});
  factory TestApi.fromJson(Map<String, dynamic> json) {
    return TestApi(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"]);
  }
}
