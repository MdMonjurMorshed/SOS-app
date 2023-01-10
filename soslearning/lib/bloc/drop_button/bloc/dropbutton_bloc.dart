import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dropbutton_event.dart';
part 'dropbutton_state.dart';

class DropbuttonBloc extends Bloc<DropbuttonEvent, DropbuttonState> {
  DropbuttonBloc() : super(DropbuttonInitial()) {
    on<DropbuttonEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
