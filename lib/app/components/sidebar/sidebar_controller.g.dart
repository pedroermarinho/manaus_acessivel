// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sidebar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SidebarController on _SidebarControllerBase, Store {
  final _$userAtom = Atom(name: '_SidebarControllerBase.user');

  @override
  Usuario get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(Usuario value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_SidebarControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$animationControllerAtom =
      Atom(name: '_SidebarControllerBase.animationController');

  @override
  AnimationController get animationController {
    _$animationControllerAtom.context
        .enforceReadPolicy(_$animationControllerAtom);
    _$animationControllerAtom.reportObserved();
    return super.animationController;
  }

  @override
  set animationController(AnimationController value) {
    _$animationControllerAtom.context.conditionallyRunInAction(() {
      super.animationController = value;
      _$animationControllerAtom.reportChanged();
    }, _$animationControllerAtom,
        name: '${_$animationControllerAtom.name}_set');
  }

  final _$isSidebarOpenedStreamControllerAtom =
      Atom(name: '_SidebarControllerBase.isSidebarOpenedStreamController');

  @override
  StreamController<bool> get isSidebarOpenedStreamController {
    _$isSidebarOpenedStreamControllerAtom.context
        .enforceReadPolicy(_$isSidebarOpenedStreamControllerAtom);
    _$isSidebarOpenedStreamControllerAtom.reportObserved();
    return super.isSidebarOpenedStreamController;
  }

  @override
  set isSidebarOpenedStreamController(StreamController<bool> value) {
    _$isSidebarOpenedStreamControllerAtom.context.conditionallyRunInAction(() {
      super.isSidebarOpenedStreamController = value;
      _$isSidebarOpenedStreamControllerAtom.reportChanged();
    }, _$isSidebarOpenedStreamControllerAtom,
        name: '${_$isSidebarOpenedStreamControllerAtom.name}_set');
  }

  final _$isSidebarOpenedStreamAtom =
      Atom(name: '_SidebarControllerBase.isSidebarOpenedStream');

  @override
  Stream<bool> get isSidebarOpenedStream {
    _$isSidebarOpenedStreamAtom.context
        .enforceReadPolicy(_$isSidebarOpenedStreamAtom);
    _$isSidebarOpenedStreamAtom.reportObserved();
    return super.isSidebarOpenedStream;
  }

  @override
  set isSidebarOpenedStream(Stream<bool> value) {
    _$isSidebarOpenedStreamAtom.context.conditionallyRunInAction(() {
      super.isSidebarOpenedStream = value;
      _$isSidebarOpenedStreamAtom.reportChanged();
    }, _$isSidebarOpenedStreamAtom,
        name: '${_$isSidebarOpenedStreamAtom.name}_set');
  }

  final _$isSidebarOpenedSinkAtom =
      Atom(name: '_SidebarControllerBase.isSidebarOpenedSink');

  @override
  StreamSink<bool> get isSidebarOpenedSink {
    _$isSidebarOpenedSinkAtom.context
        .enforceReadPolicy(_$isSidebarOpenedSinkAtom);
    _$isSidebarOpenedSinkAtom.reportObserved();
    return super.isSidebarOpenedSink;
  }

  @override
  set isSidebarOpenedSink(StreamSink<bool> value) {
    _$isSidebarOpenedSinkAtom.context.conditionallyRunInAction(() {
      super.isSidebarOpenedSink = value;
      _$isSidebarOpenedSinkAtom.reportChanged();
    }, _$isSidebarOpenedSinkAtom,
        name: '${_$isSidebarOpenedSinkAtom.name}_set');
  }

  final _$getUserAsyncAction = AsyncAction('getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  @override
  String toString() {
    final string =
        'user: ${user.toString()},loading: ${loading.toString()},animationController: ${animationController.toString()},isSidebarOpenedStreamController: ${isSidebarOpenedStreamController.toString()},isSidebarOpenedStream: ${isSidebarOpenedStream.toString()},isSidebarOpenedSink: ${isSidebarOpenedSink.toString()}';
    return '{$string}';
  }
}
