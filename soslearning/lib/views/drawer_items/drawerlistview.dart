import 'package:flutter/material.dart';
import 'package:soslearning/views/draweritem_topage/profile_info.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerList extends StatelessWidget {
  List drawer_list = [
    'See All Courses',
    'Make Payment',
    'Information Bank',
    'Notifications',
    'GPA & CGPA Calculator',
    'Earning',
    'Suggestions',
    'Smart Book',
    'Note Book',
    'Exam Center',
    'Question Bank',
    'Syllabus',
    'Book List',
    'Parent App',
    'BTEB Notice',
    'Contract Us',
    'Terms & Condition'
  ];

  List drawerlist_page = <Widget>[
    ProfileInfo(),
    ProfileInfo(),
    ProfileInfo(),
    ProfileInfo(),
    ProfileInfo(),
    ProfileInfo(),
    ProfileInfo(),
    ProfileInfo(),
    ProfileInfo(),
    ProfileInfo(),
    ProfileInfo(),
    ProfileInfo(),
    ProfileInfo(),
    ProfileInfo(),
    ProfileInfo(),
    ProfileInfo(),
    ProfileInfo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ExpansionTile(
            title: Text('Courses'),
            leading: Container(
              height: 30,
              width: 30,
              child: Icon(Icons.alternate_email_sharp),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            collapsedTextColor: Colors.black,
            textColor: Colors.teal,
            iconColor: Colors.teal,
            collapsedIconColor: Colors.black,
            children: [
              ListTile(
                title: Text('My Courses'),
              ),
              ListTile(
                title: Text('Active Courses'),
              ),
            ],
          ),
          Column(
            children: List.generate(
                drawer_list.length,
                (index) => ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => drawerlist_page[index]));
                      },
                      leading: Icon(Icons.alternate_email_sharp),
                      title: Text(drawer_list[index]),
                    )),
          ),
        ],
      ),
    );
  }
}
