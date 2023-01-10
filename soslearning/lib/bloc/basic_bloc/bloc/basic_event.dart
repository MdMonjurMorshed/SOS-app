part of 'basic_bloc.dart';

@immutable
abstract class BasicEvent {}

class BasicLoadedEvent extends BasicEvent {
  String stringUrl;
  BasicLoadedEvent({required this.stringUrl}) {
    print("event is called");
    print(stringUrl);
  }
}
