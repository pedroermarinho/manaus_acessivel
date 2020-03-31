import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'text_field_custom_controller.g.dart';

class TextFieldCustomController = _TextFieldCustomControllerBase
    with _$TextFieldCustomController;

abstract class _TextFieldCustomControllerBase with Store {
  @observable
  String labelText;

  @observable
  Function(String) onChanged;

  @observable
  String Function() errorText;

  @observable
  TextInputType textInputType;

  @action
  setLabelText(String value) => labelText = value;

  @action
  setOnChanged(Function(String) value) => onChanged = value;

  @action
  setErrorText(String Function() value) => errorText = value;

  @action
  setInputType(TextInputType value) => textInputType = value;
}
