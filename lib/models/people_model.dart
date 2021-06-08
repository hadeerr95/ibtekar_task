import 'dart:convert';

import 'package:floor/floor.dart';

import 'known_for.dart';

PeopleModel personFromJson(String str) =>
    PeopleModel.fromJson(json.decode(str));

String personToJson(PeopleModel data) => json.encode(data.toJson());

@entity
class PeopleModel {
  PeopleModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownFor,
    required this.knownForDepartment,
    required this.name,
    required this.popularity,
    required this.profilePath,
  });

  bool adult;
  int gender;
  int id;
  List<KnownFor> knownFor;
  String knownForDepartment;
  String name;
  double popularity;
  String profilePath;

  factory PeopleModel.fromJson(Map<String, dynamic> json) => PeopleModel(
        adult: json["adult"] ?? false,
        gender: json["gender"] ?? 0,
        id: json["id"] ?? 0,
        knownFor: List<KnownFor>.from(
            json["known_for"].map((x) => KnownFor.fromJson(x))),
        knownForDepartment: json["known_for_department"] ?? "",
        name: json["name"] ?? "",
        popularity: json["popularity"].toDouble() ?? 0.0,
        profilePath: json["profile_path"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for": List<dynamic>.from(knownFor.map((x) => x.toJson())),
        "known_for_department": knownForDepartment,
        "name": name,
        "popularity": popularity,
        "profile_path": profilePath,
      };
}
