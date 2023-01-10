import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:soslearning/data_repositories/pick_image.dart';

part 'image_pick_event.dart';
part 'image_pick_state.dart';

class ImagePickBloc extends Bloc<ImagePickEvent, ImagePickState> {
  final imgRipo = ImageRepository();
  ImagePickBloc() : super(ImagePickInitial()) {
    on<ImagePickEvent>((event, emit) async {
      if (event is PickedEvent) {
        await imgRipo.pickImageFrom();
        final pick = imgRipo.fileImage!;
        emit(PickedState(picked: pick));
      }
      if (event is TookEvent) {
        await imgRipo.takeImage();
        final take = imgRipo.tookImage!;
        emit(TookState(took: take));
      }
    });
  }
}
