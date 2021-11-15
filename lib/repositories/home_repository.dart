import 'package:projeto001/models/post_models.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getList();
}
