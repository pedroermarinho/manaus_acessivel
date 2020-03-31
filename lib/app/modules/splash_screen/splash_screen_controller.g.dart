// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashScreenController on _SplashScreenControllerBase, Store {
  final _$disposerAtom = Atom(name: '_SplashScreenControllerBase.disposer');

  @override
  ReactionDisposer get disposer {
    _$disposerAtom.context.enforceReadPolicy(_$disposerAtom);
    _$disposerAtom.reportObserved();
    return super.disposer;
  }

  @override
  set disposer(ReactionDisposer value) {
    _$disposerAtom.context.conditionallyRunInAction(() {
      super.disposer = value;
      _$disposerAtom.reportChanged();
    }, _$disposerAtom, name: '${_$disposerAtom.name}_set');
  }

  final _$isValidAsyncAction = AsyncAction('isValid');

  @override
  Future isValid() {
    return _$isValidAsyncAction.run(() => super.isValid());
  }

  @override
  String toString() {
    final string = 'disposer: ${disposer.toString()}';
    return '{$string}';
  }
}
