part of 'thumbnail_bloc.dart';

@immutable
abstract class ThumbnailState {}

class ThumbnailInitial extends ThumbnailState {}

class ThumbnailLoadingState extends ThumbnailState {}

class ThumbnailLoadedState extends ThumbnailState {
  List<VideoModel> vidList;
  ThumbnailLoadedState({required this.vidList});
}

class ThumbnailNotLoadedState extends ThumbnailState {}
