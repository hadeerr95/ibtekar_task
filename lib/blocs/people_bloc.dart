import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibtekar_task/blocs/people_event.dart';
import 'package:ibtekar_task/blocs/people_state.dart';

class PeopleBloc extends Bloc<BasePeopleEvent, PeopleListState> {
  PeopleBloc(PeopleListState initialState) : super(initialState);

  @override
  Stream<PeopleListState> mapEventToState(BasePeopleEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
