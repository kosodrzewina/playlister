// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  final _$apiKeyAtom = Atom(name: '_AuthStore.apiKey');

  @override
  String? get apiKey {
    _$apiKeyAtom.reportRead();
    return super.apiKey;
  }

  @override
  set apiKey(String? value) {
    _$apiKeyAtom.reportWrite(value, super.apiKey, () {
      super.apiKey = value;
    });
  }

  final _$_AuthStoreActionController = ActionController(name: '_AuthStore');

  @override
  void setApiKey(String? apiKey) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setApiKey');
    try {
      return super.setApiKey(apiKey);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
apiKey: ${apiKey}
    ''';
  }
}
