part of 'slide_bloc_bloc.dart';

@immutable
abstract class SlideBlocEvent {}

class PageChangeEvent extends SlideBlocEvent {
  int? page;
  PageChangeEvent({this.page});
}
