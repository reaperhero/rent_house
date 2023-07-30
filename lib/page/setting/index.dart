import 'package:flutter/material.dart';

import '../../widget/common_toast.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              CommonToast.showToast('已经退出登录');
            },
            child: const Text(
              '退出登录',
              style: TextStyle(),
            ),
          )
        ],
      ),
    );
  }
}


