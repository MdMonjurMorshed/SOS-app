part of 'slide_bloc_bloc.dart';

@immutable
abstract class SlideBlocState {}

class SlideBlocInitial extends SlideBlocState {}

class PageChangeState extends SlideBlocState {
  int? page_vlaue;
  PageChangeState({this.page_vlaue});
}
