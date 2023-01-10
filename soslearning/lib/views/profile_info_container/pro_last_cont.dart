import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:soslearning/themes/theme.dart';
import 'package:soslearning/views/profile_info_container/button_to_page/CourseSelect/course_selection.dart';
import 'package:soslearning/views/profile_info_container/button_to_page/leaderBoard/leader_board.dart';
import 'package:soslearning/views/profile_info_container/button_to_page/learningAnalysis/learning_analysis.dart';
import 'package:soslearning/views/profile_info_container/button_to_page/paymentHistory/payment_history.dart';

class ProfileCont extends StatelessWidget {
  const ProfileCont({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          // this container is for the button

          //of course

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CourseSelection();
                    }));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3.6,
                    child: GradientText(
                      'selected course',
                      style: AppTheme.text.proinfo_but1,
                      colors: [
                        Color.fromARGB(255, 240, 2, 133),
                        Colors.orange,
                        Colors.orange
                      ],
                    ),
                  ),
                ),
                Container(
                    child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.pink,
                ))
              ],
            ),
            height: 50,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26, blurRadius: 10, spreadRadius: 1)
                ]),
          ),

          SizedBox(
            height: 15,
          ),

          // this container is for the point button

          Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientText(
                    '25.00',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                    colors: [Color.fromARGB(255, 240, 2, 133), Colors.orange],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Points',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFF02C02),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                  )
                ],
              ),
            ),
            height: 50,
            width: 150,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: .5)
            ], color: Colors.white, borderRadius: BorderRadius.circular(50)),
          ),

          SizedBox(
            height: 15,
          ),

          // this container is for three bloc button

          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.badge),
                        Text(
                          'Gold Badge',
                          style: AppTheme.text.goldbadge_text,
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            spreadRadius: .5)
                      ]),
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "0.00",
                          style: AppTheme.text.cgpa,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "CGPA",
                          style: AppTheme.text.cgpa_text,
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            spreadRadius: .5)
                      ]),
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "11",
                              style: AppTheme.text.view_num,
                            ),
                            Text(
                              "m",
                              style: AppTheme.text.view_min,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "view",
                          style: AppTheme.text.cgpa_text,
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            spreadRadius: .5)
                      ]),
                )
              ],
            ),
          ),

          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),

                //
                // LEARNING ANALICIS BUTTON
                //
                Container(
                  width: MediaQuery.of(context).size.width / 1.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            spreadRadius: 1)
                      ]),
                  child: Material(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LearningAnalysis();
                        }));
                      },
                      leading: Icon(
                        Icons.menu_book_sharp,
                        color: Colors.black,
                      ),
                      title: Text('Learning analysis'),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                //
                // LEADER BOARD BUTTON
                //

                Container(
                  width: MediaQuery.of(context).size.width / 1.05,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 5, spreadRadius: 1)
                  ]),
                  child: Material(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LeaderBoard();
                        }));
                      },
                      leading: Icon(
                        Icons.leaderboard_rounded,
                        color: Colors.black,
                      ),
                      title: Text('Leader Board'),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                //
                // PAYMENT HISTORY BUTTON
                //

                Container(
                  width: MediaQuery.of(context).size.width / 1.05,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 5, spreadRadius: 1)
                  ]),
                  child: Material(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PaymentHistory();
                        }));
                      },
                      leading: Icon(
                        Icons.payment_outlined,
                        color: Colors.black,
                      ),
                      title: Text('Payment History'),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
