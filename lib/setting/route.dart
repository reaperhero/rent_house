import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../page/home/home.dart';
import '../page/not_found/page.dart';

class Routes {
  // 定义路由名称
  static String home = '/';

  static final Handler _notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return const NotFoundPage();
      });


  static final Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return const HomePage();
      });


  // 编写路由处理函数
  static void configureRoutes(FluroRouter router) {
    router.define(home, handler: _homeHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}
