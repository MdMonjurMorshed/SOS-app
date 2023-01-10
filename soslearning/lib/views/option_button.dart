import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soslearning/bloc/bloc/course_bloc.dart';
import 'package:soslearning/themes/theme.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 0),
          child: ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                backgroundColor: MaterialStateProperty.all(
                    AppTheme.color.elevatedButtonColor)),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BlocBuilder<CourseBloc, CourseState>(
                        builder: (context, state) {
                      if (state is CourseLoadedState) {
                        final list = state.cmlist;
                        return ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(title: Text(list[index].title)),
                              );
                            });
                      }
                      return Container();
                    });
                  });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('courses'),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
        ));
  }
}
