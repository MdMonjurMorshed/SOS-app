import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:soslearning/data_repositories/video_repo.dart';
import 'package:soslearning/models/video_model.dart';

part 'thumbnail_event.dart';
part 'thumbnail_state.dart';

class ThumbnailBloc extends Bloc<ThumbnailEvent, ThumbnailState> {
  final vidripo = VideoRepository();
  ThumbnailBloc() : super(ThumbnailInitial()) {
    on<ThumbnailEvent>((event, emit) async {
      final vidtrans = await vidripo.getVideo();

      if (event is ThumbnailLoadedEvent) {
        emit(ThumbnailLoadingState());
        try {
          emit(ThumbnailLoadedState(vidList: vidtrans));
        } catch (e) {
          print(e.toString());
        }
      } else {
        emit(ThumbnailNotLoadedState());
      }
    });

    // TODO: implement event handler
  }
}
