import 'package:flutter_scaffold/core/models/article.dart';
import 'package:flutter_scaffold/core/models/user.dart';

import 'api.dart';

class HttpApi extends Api {
  @override
  Future<User> login(String username, String password) {
    // TODO: implement login
    return null;
  }

  @override
  Future<List<Article>> getArticles(int userId) {
    // TODO: implement getArticles
    return null;
  }
}
