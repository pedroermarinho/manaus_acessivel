import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/information/models/comment_model.dart';
import 'package:manausacessivel/app/modules/information/models/stars_model.dart';
import 'package:mysql1/mysql1.dart';

abstract class IStarsRepository{
  Future<Results> getStars(String idMarker);

  Future<Results> saveStars(StarsModel stars);

  Future<Results> deleteStars(StarsModel stars);

  Future<Results> deleteAllStars(String idMarker);
}
