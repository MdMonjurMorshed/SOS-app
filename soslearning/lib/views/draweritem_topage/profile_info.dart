import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soslearning/bloc/Image_pick/bloc/image_pick_bloc.dart';
import 'dart:io';

import 'package:soslearning/themes/theme.dart';
import 'package:soslearning/views/profile_info_container/pro_last_cont.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo({Key? key}) : super(key: key);

  File? passimage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Stack(
          children: [
            SizedBox(
              height: 50,
            ),

            //this position is for the back button

            Positioned(
              top: 80,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  child: Icon(Icons.arrow_back_ios_new_rounded),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 1)
                    ],
                  ),
                ),
              ),
            ),

            // this position is for the image

            Positioned(
              left: MediaQuery.of(context).size.width / 2.6,
              top: MediaQuery.of(context).size.height / 3.7,
              child: BlocBuilder<ImagePickBloc, ImagePickState>(
                  builder: ((context, state) {
                if (state is TookState) {
                  return Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(state.took), fit: BoxFit.fill),
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 5, color: Colors.white)),
                  );
                }
                if (state is PickedState) {
                  passimage = state.picked;
                  return Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(state.picked), fit: BoxFit.fill),
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 5, color: Colors.white)),
                  );
                }

                return Container(
                  height: 100,
                  width: 100,
                  child: Icon(Icons.person),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 5, color: Colors.white)),
                );
              })),
            ),

            // this position is for the edit button

            Positioned(
                left: MediaQuery.of(context).size.width / 1.8,
                top: MediaQuery.of(context).size.height / 3,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        context: context,
                        builder: (context) => Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('Choose options'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton.icon(
                                          onPressed: () {
                                            BlocProvider.of<ImagePickBloc>(
                                                    context)
                                                .add(TookEvent());
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(Icons.camera),
                                          label: Text('Camera')),
                                      TextButton.icon(
                                          onPressed: () {
                                            BlocProvider.of<ImagePickBloc>(
                                                    context)
                                                .add(PickedEvent());

                                            Navigator.pop(context);
                                          },
                                          icon: Icon(Icons.photo),
                                          label: Text('Gallery')),
                                    ],
                                  )
                                ],
                              ),
                              height: 200,
                              width: double.infinity,
                            ));
                  },
                  child: Container(
                    child: Icon(
                      Icons.mode_edit_rounded,
                      size: 20,
                      color: Colors.pink,
                    ),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            spreadRadius: 1)
                      ],
                    ),
                  ),
                )),

            //this position is for the profile name

            Positioned(
                top: MediaQuery.of(context).size.height / 2.5,
                left: MediaQuery.of(context).size.width / 2.8,
                child: Text(
                  "Softmax Dev",
                  style: AppTheme.text.profile_title2,
                )),

            /// THIS POSITION IS FOR THE PROFILE BELONGINGS ///

            Positioned(
              bottom: 0,
              child: Container(
                  height: MediaQuery.of(context).size.height / 1.8,
                  width: MediaQuery.of(context).size.width,
                  child: ProfileCont()),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.orange,
        Colors.white,
        Colors.white,
        Colors.white,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    );
  }
}
