import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../page/home/home.dart';
import '../page/login/login.dart';
import '../page/not_found/page.dart';
import '../page/register/register.dart';
import '../page/room_add/index.dart';
import '../page/room_detail/index.dart';
import '../page/room_manage/index.dart';
import '../page/setting/index.dart';

class Routes {
  // 定义路由名称
  static String home = '/';
  static String login = 'login';
  static String register = '/register';
  static String setting = '/setting';
  static String roomManage = '/roomManage';
  static String roomAdd = '/roomAdd';
  static String roomDetail = '/roomDetail/:roomId';

  static final Handler _notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return const NotFoundPage();
      });


  static final Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return const HomePage();
      });

  static final Handler _loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return const LoginPage();
      });

  static final Handler _registerHanlder = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return const RegisterPage();
      });


  static final Handler _settingHanlder = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return const SettingPage();
      });

  static final Handler _roomManageHanlder = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return const RoomManagerPage();
      });

  static final Handler _roomAddHanlder = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return const RoomAddPage();
      });

  static final Handler _roomDetailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return RoomDetailPage(
          roomId: params['roomId']![0],
        );
      });


  // 编写路由处理函数
  static void configureRoutes(FluroRouter router) {
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(register, handler: _registerHanlder);
    router.define(setting, handler: _settingHanlder);
    router.define(roomManage, handler: _roomManageHanlder);
    router.define(roomAdd, handler: _roomAddHanlder);
    router.define(roomDetail, handler: _roomDetailHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}
