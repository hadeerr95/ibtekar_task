abstract class BasePeopleEvent {}

class PeopleListEvent extends BasePeopleEvent {
  final int page;

  PeopleListEvent(this.page);
}

class PeopleDescriptionEvent extends BasePeopleEvent {}
