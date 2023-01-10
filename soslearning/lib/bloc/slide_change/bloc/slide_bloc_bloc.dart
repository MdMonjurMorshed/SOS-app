import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'slide_bloc_event.dart';
part 'slide_bloc_state.dart';

class SlideBlocBloc extends Bloc<SlideBlocEvent, SlideBlocState> {
  SlideBlocBloc() : super(SlideBlocInitial()) {
    on<SlideBlocEvent>((event, emit) {
      if (event is PageChangeEvent) {
        emit(PageChangeState(page_vlaue: event.page));
      } else {
        throw 'something went wrong at slider bloc';
      }
    });
  }
}
