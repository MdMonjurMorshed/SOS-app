part of 'image_pick_bloc.dart';

@immutable
abstract class ImagePickState {}

class ImagePickInitial extends ImagePickState {}

class PickedState extends ImagePickState {
  final File picked;
  PickedState({required this.picked});
}

class TookState extends ImagePickState {
  final File took;
  TookState({required this.took});
}
