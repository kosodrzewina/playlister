// ignore_for_file: use_setters_to_change_properties
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  static const apiKeyKey = 'API_KEY';

  late ReactionDisposer _saveDisposer;

  @observable
  String? apiKey;

  _AuthStore({required SharedPreferences sharedPrefs}) {
    setApiKey(sharedPrefs.getString(apiKeyKey));

    _saveDisposer = reaction<String?>(
      (_) => apiKey,
      (apiKey) async {
        if (apiKey == null) {
          await sharedPrefs.remove(apiKeyKey);
        } else {
          await sharedPrefs.setString(apiKeyKey, apiKey);
        }
      },
    );
  }

  @action
  void setApiKey(String? apiKey) {
    this.apiKey = apiKey;
  }

  void dispose() {
    _saveDisposer();
  }
}
