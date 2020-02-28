import 'package:flutter_widget/entity/jjb_data_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "JjbDataEntity") {
      return JjbDataEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}