import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:rent_house/scoped_model/data.dart';
import 'package:rent_house/setting/route.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRoutes(router);

    final app = MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generator, //全局注册
    );
    return ScopedModel<FilterBarModel>(
      model: FilterBarModel(),
      child: app,
    );
  }
}
