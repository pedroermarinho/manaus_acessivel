// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_field_custom_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TextFieldCustomController on _TextFieldCustomControllerBase, Store {
  final _$labelTextAtom =
      Atom(name: '_TextFieldCustomControllerBase.labelText');

  @override
  String get labelText {
    _$labelTextAtom.context.enforceReadPolicy(_$labelTextAtom);
    _$labelTextAtom.reportObserved();
    return super.labelText;
  }

  @override
  set labelText(String value) {
    _$labelTextAtom.context.conditionallyRunInAction(() {
      super.labelText = value;
      _$labelTextAtom.reportChanged();
    }, _$labelTextAtom, name: '${_$labelTextAtom.name}_set');
  }

  final _$onChangedAtom =
      Atom(name: '_TextFieldCustomControllerBase.onChanged');

  @override
  dynamic Function(String) get onChanged {
    _$onChangedAtom.context.enforceReadPolicy(_$onChangedAtom);
    _$onChangedAtom.reportObserved();
    return super.onChanged;
  }

  @override
  set onChanged(dynamic Function(String) value) {
    _$onChangedAtom.context.conditionallyRunInAction(() {
      super.onChanged = value;
      _$onChangedAtom.reportChanged();
    }, _$onChangedAtom, name: '${_$onChangedAtom.name}_set');
  }

  final _$errorTextAtom =
      Atom(name: '_TextFieldCustomControllerBase.errorText');

  @override
  String Function() get errorText {
    _$errorTextAtom.context.enforceReadPolicy(_$errorTextAtom);
    _$errorTextAtom.reportObserved();
    return super.errorText;
  }

  @override
  set errorText(String Function() value) {
    _$errorTextAtom.context.conditionallyRunInAction(() {
      super.errorText = value;
      _$errorTextAtom.reportChanged();
    }, _$errorTextAtom, name: '${_$errorTextAtom.name}_set');
  }

  final _$textInputTypeAtom =
      Atom(name: '_TextFieldCustomControllerBase.textInputType');

  @override
  TextInputType get textInputType {
    _$textInputTypeAtom.context.enforceReadPolicy(_$textInputTypeAtom);
    _$textInputTypeAtom.reportObserved();
    return super.textInputType;
  }

  @override
  set textInputType(TextInputType value) {
    _$textInputTypeAtom.context.conditionallyRunInAction(() {
      super.textInputType = value;
      _$textInputTypeAtom.reportChanged();
    }, _$textInputTypeAtom, name: '${_$textInputTypeAtom.name}_set');
  }

  final _$_TextFieldCustomControllerBaseActionController =
      ActionController(name: '_TextFieldCustomControllerBase');

  @override
  dynamic setLabelText(String value) {
    final _$actionInfo =
        _$_TextFieldCustomControllerBaseActionController.startAction();
    try {
      return super.setLabelText(value);
    } finally {
      _$_TextFieldCustomControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOnChanged(dynamic Function(String) value) {
    final _$actionInfo =
        _$_TextFieldCustomControllerBaseActionController.startAction();
    try {
      return super.setOnChanged(value);
    } finally {
      _$_TextFieldCustomControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setErrorText(String Function() value) {
    final _$actionInfo =
        _$_TextFieldCustomControllerBaseActionController.startAction();
    try {
      return super.setErrorText(value);
    } finally {
      _$_TextFieldCustomControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInputType(TextInputType value) {
    final _$actionInfo =
        _$_TextFieldCustomControllerBaseActionController.startAction();
    try {
      return super.setInputType(value);
    } finally {
      _$_TextFieldCustomControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'labelText: ${labelText.toString()},onChanged: ${onChanged.toString()},errorText: ${errorText.toString()},textInputType: ${textInputType.toString()}';
    return '{$string}';
  }
}
