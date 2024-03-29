import 'package:flutter_scaffold/core/get_it.dart';
import 'package:flutter_scaffold/core/scoped_models/base_model.dart';
import 'package:flutter_scaffold/core/services/user_service.dart';
import 'package:logger/logger.dart';

class LoginModel extends BaseModel {
  var _userService = getIt<UserService>();
  var _log = getIt<Logger>();

  /// 登陆
  ///
  /// [username] 用户名
  /// [password] 密码
  Future<bool> login(String username, String password) async {
    _log.d("username: $username, password: $password");
    try {
      setState(ViewState.Busy);
      await _userService.login(username, password);
      setState(ViewState.Success);
    } catch (e) {
      catchError(e);
    }
    return isSuccess;
  }
}
