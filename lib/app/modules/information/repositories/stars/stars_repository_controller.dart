import 'package:flutter_modular/flutter_modular.dart';
import 'package:manausacessivel/app/modules/information/models/stars_model.dart';
import 'package:mobx/mobx.dart';
import 'package:mysql1/mysql1.dart';

import 'repository/stars_repository_interface.dart';

part 'stars_repository_controller.g.dart';

class StarsRepositoryController = _StarsRepositoryControllerBase
    with _$StarsRepositoryController;

abstract class _StarsRepositoryControllerBase with Store {
  final _starsRepository = Modular.get<IStarsRepository>();

  /// Estrelas do Marcador
  ///
  /// A busca é feita atraves do id do marcador e do usuario
  Future<StarsModel> getStars(String idMarker) async {
    Results results = await _starsRepository.getStars(idMarker);
    print(results.toList());
    if(results.isNotEmpty) {
      var data = results.toList()[0];
      print(data);
      StarsModel stars = StarsModel(
        idStars: data["idStars"],
        idMarker: data["idMarker"],
        idUser: data["idUser"],
      );
      return stars;
    }else{
      return null;
    }
  }

  /// Salvar novo comentario
  ///
  /// A ação é feita atravez de um instacia do objeto
  Future<Results> saveStars(StarsModel stars) {
    return _starsRepository.saveStars(stars);
  }

  /// Deletar um comentario
  ///
  /// A ação é feita atravez de um instacia do objeto
  Future<Results> deleteStars(StarsModel stars) {
    return _starsRepository.deleteStars(stars);
  }

  /// Deletar todos comentarios
  ///
  /// A ação é feita atravez do id do Marcador
  Future<Results> deleteAllStars(String idMarker) {
    return _starsRepository.deleteAllStars(idMarker);
  }
}
