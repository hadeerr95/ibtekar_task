import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibtekar_task/blocs/people_event.dart';
import 'package:ibtekar_task/blocs/people_state.dart';
import 'package:ibtekar_task/services/people_list_service.dart';

class PeopleBloc extends Bloc<BasePeopleEvent, PeopleListState> {
  PeopleBloc(PeopleListState initialState) : super(initialState);

  @override
  Stream<PeopleListState> mapEventToState(BasePeopleEvent event) async* {
    PeopleListService service = new PeopleListService();
    if (event is PeopleListEvent) {
      yield PeopleListFetchedState(
          await service.fetchPersons(page: event.page));
    }
  }
}
