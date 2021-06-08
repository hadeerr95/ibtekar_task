import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ibtekar_task/constants/constant.dart';
import 'package:ibtekar_task/models/people_model.dart';
import 'package:ibtekar_task/storage/hive_storage_helper.dart';
import 'package:ibtekar_task/storage/storage_keys.dart';

class PeopleListService {
  var dio;
  PeopleListService() {
    dio = Dio();
  }

  Future<List<PeopleModel>> fetchPersons({int page = 1}) async {
    print("actual page sent for api is $page");

    dynamic totlalPage =
        HiveStorage.singleton?.getFromBox(StorageKeys.TOTAL_PAGES_KEY);

    if (totlalPage == null || totlalPage >= page) {
      final response = await dio
          .get(BASE_URL + 'popular?api_key=$API_KEY&language=en-US&page=$page');
      final responseDecoded = json.decode(response.toString());

      if (totlalPage == 0) {
        HiveStorage.singleton?.putInBox(
            StorageKeys.TOTAL_PAGES_KEY, responseDecoded["total_pages"]);
      }
      if (response.statusCode == 200) {
        var persons = List<PeopleModel>.from(
            (responseDecoded["results"] as List)
                .map((e) => PeopleModel.fromJson((e)))).toList();

        //save data in locale
        savePeoplesLocale(persons);

        return persons;
      }
      return [];
    } else {
      return [];
    }
  }

  void savePeoplesLocale(List<PeopleModel> persons) async {}
}
