import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:soslearning/data_repositories/course_repo.dart';
import 'package:soslearning/models/course_model.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final repository = CourseRipo();

  CourseBloc() : super(CourseLoadingState()) {
    on<CourseEvent>((event, emit) async {
      final clist = await repository.getPost();
      if (event is DataLoadedEvent) {
        emit(CourseLoadingState());
        try {
          emit(CourseLoadedState(cmlist: clist));
        } catch (e) {
          print(e.toString());
        }
      } else {
        emit(CourseNotLoadedState());
      }
    });
  }
}
