import 'package:cilekhavuz/api/base.dart';
import 'package:cilekhavuz/models/AuthModel.dart';
import 'package:cilekhavuz/utils/constants.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    loginFunc();
  }

  Future<void> loginFunc() async {
    await BASE.getUser().then((user) {
      String push;
      if (user != null) {
        push = Routes.DASHBOARD;
      } else {
        push = Routes.AUTHENTICATION;
      }
      Navigator.of(context).pushNamedAndRemoveUntil(push, (route) => route.isCurrent && ModalRoute.of(context)!.settings.name == push ? false : true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 70,
          height: 70,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
