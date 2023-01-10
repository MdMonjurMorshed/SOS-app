import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soslearning/bloc/Image_pick/bloc/image_pick_bloc.dart';
import 'package:soslearning/themes/theme.dart';
import 'package:soslearning/views/draweritem_topage/profile_info.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dart:io';

class DrawerProfile extends StatelessWidget {
  DrawerProfile({Key? key}) : super(key: key);

  File? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue[50],
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            height: 100,
            width: double.maxFinite,
            child: ListTile(
              onTap: () {
                fun(context);
              },
              title: Text(
                'Softmax dev',
                style: AppTheme.text.profile_title,
              ),
              subtitle: Text('polytecnic'),
              leading: BlocBuilder<ImagePickBloc, ImagePickState>(
                builder: (context, state) {
                  if (state is PickedState) {
                    return CircleAvatar(
                      backgroundColor: Colors.grey,
                      foregroundImage: FileImage(state.picked, scale: 2),
                      radius: 30,
                    );
                  }

                  if (state is TookState) {
                    return CircleAvatar(
                      backgroundColor: Colors.grey,
                      foregroundImage: FileImage(state.took, scale: 2),
                      radius: 30,
                    );
                  }

                  return CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    radius: 30,
                  );
                },
              ),
              trailing: Container(
                height: 30,
                width: 30,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: AppTheme.color.medel_lengradient),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientText(
                    '25.00',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    colors: [Color(0xFFF02C02), Colors.orange],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Points',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFF02C02),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            height: 50,
            width: 200,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 15, spreadRadius: 1)
            ], color: Colors.white, borderRadius: BorderRadius.circular(50)),
          ),
        ],
      ),
    );
  }

  void fun(BuildContext context) async {
    final result =
        Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProfileInfo();
    }));
  }
}
