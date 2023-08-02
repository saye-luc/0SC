import 'package:flutter/material.dart';
import 'package:sosvolaille/pages/register_page.dart';

import 'login_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //initiale show login page
  bool showLoginPage = true;
  //toogle bettween login and register page
  void tooglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: tooglePage);
    } else {
      return RegisterPage(onTap: tooglePage);
    }
  }
}
