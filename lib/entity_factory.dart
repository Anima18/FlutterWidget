import 'package:flutter_widget/entity/jjb_data_entity.dart';
import 'package:flutter_widget/entity/github_user_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "JjbDataEntity") {
      return JjbDataEntity.fromJson(json) as T;
    } else if (T.toString() == "GithubUserEntity") {
      return GithubUserEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}