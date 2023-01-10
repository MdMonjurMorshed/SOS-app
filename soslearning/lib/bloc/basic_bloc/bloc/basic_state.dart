part of 'basic_bloc.dart';

@immutable
abstract class BasicState {}

class BasicInitial extends BasicState {
  BasicInitial() {
    print("inoitial state is running");
  }
}

class BasicLoadingState extends BasicState {}

class BasicLoadedState extends BasicState {
  List<VideoModel> listVideo;

  BasicLoadedState({required this.listVideo});
}

class BasicLoadedError extends BasicState {}
