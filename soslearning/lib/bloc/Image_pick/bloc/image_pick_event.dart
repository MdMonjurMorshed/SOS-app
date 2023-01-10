part of 'image_pick_bloc.dart';

@immutable
abstract class ImagePickEvent {}

class PickedEvent extends ImagePickEvent {}

class TookEvent extends ImagePickEvent {}
