// ignore_for_file: use_setters_to_change_properties
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  static const apiKeyKey = 'API_KEY';

  _AuthStore() {
    reaction<String?>((_) => this.apiKey, (apiKey) async {
      final sharedPrefs = await SharedPreferences.getInstance();

      if (apiKey == null) {
        await sharedPrefs.remove(apiKeyKey);
      } else {
        await sharedPrefs.setString(apiKeyKey, apiKey);
      }
    });
  }

  Future<void> initialize() async {
    final sharedPrefs = await SharedPreferences.getInstance();

    setApiKey(sharedPrefs.getString(apiKeyKey));
  }

  @observable
  String? apiKey;

  @action
  void setApiKey(String? apiKey) {
    this.apiKey = apiKey;
  }
}
