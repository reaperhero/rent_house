import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录"),
      ),
      // child: PageContent(name: "登录"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: "账号",
                  hintText: "请输入账号",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                obscureText: !showPassword,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                        showPassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                child: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "找回密码",
                    style: TextStyle(color: Colors.blue),
                    textAlign: TextAlign.right,
                  ),
                ),
                onTap: () {
                },
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text("登录"),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text("注册"),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'register');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

