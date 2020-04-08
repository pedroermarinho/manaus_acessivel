// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stars_icon_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StarsIconController on _StarsIconControllerBase, Store {
  final _$starsAtom = Atom(name: '_StarsIconControllerBase.stars');

  @override
  StarsModel get stars {
    _$starsAtom.context.enforceReadPolicy(_$starsAtom);
    _$starsAtom.reportObserved();
    return super.stars;
  }

  @override
  set stars(StarsModel value) {
    _$starsAtom.context.conditionallyRunInAction(() {
      super.stars = value;
      _$starsAtom.reportChanged();
    }, _$starsAtom, name: '${_$starsAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'stars: ${stars.toString()}';
    return '{$string}';
  }
}
