part of 'course_bloc.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoadingState extends CourseState {}

class CourseLoadedState extends CourseState {
  final List<CourseModel> cmlist;
  CourseLoadedState({required this.cmlist});
}

class CourseNotLoadedState extends CourseState {}
