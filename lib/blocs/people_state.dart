import 'package:ibtekar_task/models/people_model.dart';

abstract class PeopleListState {}

class PlayerUninitializedState extends PeopleListState {}

class PeopleListFetchingState extends PeopleListState {}

class PeopleListFetchedState extends PeopleListState {
  final List<PeopleModel> peoples;
  PeopleListFetchedState(this.peoples);
}

class ErrorState extends PeopleListState {}

class EmptyState extends PeopleListState {}
