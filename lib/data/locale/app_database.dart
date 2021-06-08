import 'package:floor/floor.dart';
import 'package:ibtekar_task/data/locale/person_dao.dart';
import 'package:ibtekar_task/models/people_model.dart';

@Database(version: 1, entities: [PeopleModel])
abstract class AppDatabase extends FloorDatabase {
  PeopleDao get personDao;
}
