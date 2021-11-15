import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:projeto001/models/post_models.dart';
import 'package:projeto001/repositories/home_repository.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    var value = await rootBundle.loadString('assets/data.json');
    List postJson = jsonDecode(value);
    return postJson.map((e) => PostModel.fromJson(e)).toList();
  }
}
