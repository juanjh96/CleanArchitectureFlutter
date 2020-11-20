import 'dart:convert';

import 'package:ejemplo_clean_architecture_tdd/feature/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  ResultSearchModel({this.email, this.firstName, this.lastName});

  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
    };
  }

  // ignore: sort_constructors_first
  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultSearchModel(
      email: map['email'],
      firstName: map['first_name'],
      lastName: map['last_name'],
    );
  }

  String toJson() => json.encode(toMap());

  // ignore: sort_constructors_first
  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));
}
