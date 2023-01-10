import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:soslearning/data_repositories/api_repo.dart';
import 'package:soslearning/models/video_model.dart';
import 'package:soslearning/views/submodview.dart';

part 'basic_event.dart';
part 'basic_state.dart';

class BasicBloc extends Bloc<BasicEvent, BasicState> {
  final apiRipo = ApiRepo();
  BasicBloc() : super(BasicLoadingState()) {
    on<BasicEvent>((event, emit) async {
      if (event is BasicLoadedEvent) {
        await apiRipo.vidApi(event.stringUrl);
        final dataList = apiRipo.vidFile!;
        try {
          emit(BasicLoadedState(listVideo: dataList));
        } catch (e) {
          throw " this is:${e.toString()}";
        }
      } else {
        emit(BasicLoadedError());
      }
    });
  }
}
