import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manausacessivel/app/modules/information/models/stars_model.dart';

abstract class IStarsRepository {
  Stream<QuerySnapshot> getStars(String idMarker);

  Future<DocumentSnapshot> getStarsUser(String idMarker);

  Future saveStars(StarsModel stars);

  Future updateStars(StarsModel stars);

  Future deleteStars(String idStars);

  deleteAllStars(String idMarker);
}
