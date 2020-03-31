// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MarkerController on _MarkerControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$nomeAtom = Atom(name: '_MarkerControllerBase.nome');

  @override
  String get nome {
    _$nomeAtom.context.enforceReadPolicy(_$nomeAtom);
    _$nomeAtom.reportObserved();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.context.conditionallyRunInAction(() {
      super.nome = value;
      _$nomeAtom.reportChanged();
    }, _$nomeAtom, name: '${_$nomeAtom.name}_set');
  }

  final _$descricaoAtom = Atom(name: '_MarkerControllerBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.context.enforceReadPolicy(_$descricaoAtom);
    _$descricaoAtom.reportObserved();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.context.conditionallyRunInAction(() {
      super.descricao = value;
      _$descricaoAtom.reportChanged();
    }, _$descricaoAtom, name: '${_$descricaoAtom.name}_set');
  }

  final _$dmAtom = Atom(name: '_MarkerControllerBase.dm');

  @override
  bool get dm {
    _$dmAtom.context.enforceReadPolicy(_$dmAtom);
    _$dmAtom.reportObserved();
    return super.dm;
  }

  @override
  set dm(bool value) {
    _$dmAtom.context.conditionallyRunInAction(() {
      super.dm = value;
      _$dmAtom.reportChanged();
    }, _$dmAtom, name: '${_$dmAtom.name}_set');
  }

  final _$dvAtom = Atom(name: '_MarkerControllerBase.dv');

  @override
  bool get dv {
    _$dvAtom.context.enforceReadPolicy(_$dvAtom);
    _$dvAtom.reportObserved();
    return super.dv;
  }

  @override
  set dv(bool value) {
    _$dvAtom.context.conditionallyRunInAction(() {
      super.dv = value;
      _$dvAtom.reportChanged();
    }, _$dvAtom, name: '${_$dvAtom.name}_set');
  }

  final _$daAtom = Atom(name: '_MarkerControllerBase.da');

  @override
  bool get da {
    _$daAtom.context.enforceReadPolicy(_$daAtom);
    _$daAtom.reportObserved();
    return super.da;
  }

  @override
  set da(bool value) {
    _$daAtom.context.conditionallyRunInAction(() {
      super.da = value;
      _$daAtom.reportChanged();
    }, _$daAtom, name: '${_$daAtom.name}_set');
  }

  final _$diAtom = Atom(name: '_MarkerControllerBase.di');

  @override
  bool get di {
    _$diAtom.context.enforceReadPolicy(_$diAtom);
    _$diAtom.reportObserved();
    return super.di;
  }

  @override
  set di(bool value) {
    _$diAtom.context.conditionallyRunInAction(() {
      super.di = value;
      _$diAtom.reportChanged();
    }, _$diAtom, name: '${_$diAtom.name}_set');
  }

  final _$marcadorAtom = Atom(name: '_MarkerControllerBase.marcador');

  @override
  Marcador get marcador {
    _$marcadorAtom.context.enforceReadPolicy(_$marcadorAtom);
    _$marcadorAtom.reportObserved();
    return super.marcador;
  }

  @override
  set marcador(Marcador value) {
    _$marcadorAtom.context.conditionallyRunInAction(() {
      super.marcador = value;
      _$marcadorAtom.reportChanged();
    }, _$marcadorAtom, name: '${_$marcadorAtom.name}_set');
  }

  final _$selectedMarcadorAtom =
      Atom(name: '_MarkerControllerBase.selectedMarcador');

  @override
  TypeMarcador get selectedMarcador {
    _$selectedMarcadorAtom.context.enforceReadPolicy(_$selectedMarcadorAtom);
    _$selectedMarcadorAtom.reportObserved();
    return super.selectedMarcador;
  }

  @override
  set selectedMarcador(TypeMarcador value) {
    _$selectedMarcadorAtom.context.conditionallyRunInAction(() {
      super.selectedMarcador = value;
      _$selectedMarcadorAtom.reportChanged();
    }, _$selectedMarcadorAtom, name: '${_$selectedMarcadorAtom.name}_set');
  }

  final _$dropdownMenuItemsAtom =
      Atom(name: '_MarkerControllerBase.dropdownMenuItems');

  @override
  ObservableList<DropdownMenuItem<TypeMarcador>> get dropdownMenuItems {
    _$dropdownMenuItemsAtom.context.enforceReadPolicy(_$dropdownMenuItemsAtom);
    _$dropdownMenuItemsAtom.reportObserved();
    return super.dropdownMenuItems;
  }

  @override
  set dropdownMenuItems(ObservableList<DropdownMenuItem<TypeMarcador>> value) {
    _$dropdownMenuItemsAtom.context.conditionallyRunInAction(() {
      super.dropdownMenuItems = value;
      _$dropdownMenuItemsAtom.reportChanged();
    }, _$dropdownMenuItemsAtom, name: '${_$dropdownMenuItemsAtom.name}_set');
  }

  final _$dropdownMenuValueAtom =
      Atom(name: '_MarkerControllerBase.dropdownMenuValue');

  @override
  DropdownMenuItem<TypeMarcador> get dropdownMenuValue {
    _$dropdownMenuValueAtom.context.enforceReadPolicy(_$dropdownMenuValueAtom);
    _$dropdownMenuValueAtom.reportObserved();
    return super.dropdownMenuValue;
  }

  @override
  set dropdownMenuValue(DropdownMenuItem<TypeMarcador> value) {
    _$dropdownMenuValueAtom.context.conditionallyRunInAction(() {
      super.dropdownMenuValue = value;
      _$dropdownMenuValueAtom.reportChanged();
    }, _$dropdownMenuValueAtom, name: '${_$dropdownMenuValueAtom.name}_set');
  }

  final _$mensagemErroAtom = Atom(name: '_MarkerControllerBase.mensagemErro');

  @override
  String get mensagemErro {
    _$mensagemErroAtom.context.enforceReadPolicy(_$mensagemErroAtom);
    _$mensagemErroAtom.reportObserved();
    return super.mensagemErro;
  }

  @override
  set mensagemErro(String value) {
    _$mensagemErroAtom.context.conditionallyRunInAction(() {
      super.mensagemErro = value;
      _$mensagemErroAtom.reportChanged();
    }, _$mensagemErroAtom, name: '${_$mensagemErroAtom.name}_set');
  }

  final _$carregandoAtom = Atom(name: '_MarkerControllerBase.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.context.enforceReadPolicy(_$carregandoAtom);
    _$carregandoAtom.reportObserved();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.context.conditionallyRunInAction(() {
      super.carregando = value;
      _$carregandoAtom.reportChanged();
    }, _$carregandoAtom, name: '${_$carregandoAtom.name}_set');
  }

  final _$positionAtom = Atom(name: '_MarkerControllerBase.position');

  @override
  Position get position {
    _$positionAtom.context.enforceReadPolicy(_$positionAtom);
    _$positionAtom.reportObserved();
    return super.position;
  }

  @override
  set position(Position value) {
    _$positionAtom.context.conditionallyRunInAction(() {
      super.position = value;
      _$positionAtom.reportChanged();
    }, _$positionAtom, name: '${_$positionAtom.name}_set');
  }

  final _$_MarkerControllerBaseActionController =
      ActionController(name: '_MarkerControllerBase');

  @override
  dynamic setDm(bool value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setDm(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDv(bool value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setDv(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDa(bool value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setDa(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDi(bool value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setDi(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setName(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescrcao(String value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setDescrcao(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMarker(Marcador value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setMarker(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedMarker(TypeMarcador value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setSelectedMarker(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPosition(Position value) {
    final _$actionInfo = _$_MarkerControllerBaseActionController.startAction();
    try {
      return super.setPosition(value);
    } finally {
      _$_MarkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'nome: ${nome.toString()},descricao: ${descricao.toString()},dm: ${dm.toString()},dv: ${dv.toString()},da: ${da.toString()},di: ${di.toString()},marcador: ${marcador.toString()},selectedMarcador: ${selectedMarcador.toString()},dropdownMenuItems: ${dropdownMenuItems.toString()},dropdownMenuValue: ${dropdownMenuValue.toString()},mensagemErro: ${mensagemErro.toString()},carregando: ${carregando.toString()},position: ${position.toString()},isValid: ${isValid.toString()}';
    return '{$string}';
  }
}
