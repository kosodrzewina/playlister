// ignore_for_file: use_setters_to_change_properties
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  String? apiKey;

  @action
  void setApiKey(String? apiKey) {
    this.apiKey = apiKey;
  }
}
