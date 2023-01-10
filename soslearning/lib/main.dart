import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soslearning/bloc/Image_pick/bloc/image_pick_bloc.dart';
import 'package:soslearning/bloc/basic_bloc/bloc/basic_bloc.dart';
import 'package:soslearning/bloc/bloc/course_bloc.dart';
import 'package:soslearning/bloc/slide_change/bloc/slide_bloc_bloc.dart';
import 'package:soslearning/bloc/thumbnail/bloc/thumbnail_bloc.dart';
import 'package:soslearning/themes/theme.dart';

import 'views/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.top,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: false),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CourseBloc>(
            create: (context) => CourseBloc()..add(DataLoadedEvent())),
        BlocProvider<SlideBlocBloc>(create: (context) => SlideBlocBloc()),
        BlocProvider<ImagePickBloc>(create: (context) => ImagePickBloc()),
        BlocProvider<ThumbnailBloc>(create: (context) => ThumbnailBloc()),
        BlocProvider<BasicBloc>(create: (context) => BasicBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.define(),
        home: HomePage(),
      ),
    );
  }
}
