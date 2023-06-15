import 'dart:convert';

import '../models/user_model.dart';
import 'catch_storage.dart';
import 'constants.dart';

class MainUser {
  MainUser._();
  static final instance = MainUser._();

  bool _isInit = false;

  UserModel? model;

  void onInit() {
    if (_isInit == true) return null;

    update();

    _isInit = true;
  }

  void update() async {
    var value = CatchStorage.get(k_userKey);
    if (value == null) return;
    var convertDataToMap = jsonDecode(value);
    model = UserModel.fromJson(convertDataToMap);
  }
}
