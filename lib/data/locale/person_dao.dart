import 'package:floor/floor.dart';
import 'package:ibtekar_task/models/people_model.dart';

@dao
abstract class PeopleDao {
  @Query('SELECT * FROM Person')
  Future<List<PeopleModel>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<PeopleModel?> findPersonById(int id);

  @insert
  Future<void> insertPerson(PeopleModel person);
}
