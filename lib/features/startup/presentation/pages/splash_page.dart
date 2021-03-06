import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mall/core/injection.dart';
import 'package:mall/core/util/nav.dart';
import 'package:mall/features/backend/presentation/user_view_model.dart';
import 'package:mall/features/startup/presentation/startup_view_model.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void dispose() {
    super.dispose();
    print('#### _SplashPageState - dispose');
  }

  @override
  void initState() {
    super.initState();
    print('#### _SplashPageState - initState');

    _init();
  }

  Future<void> _init() async {
    final failure = await locator<StartupViewModel>().initialization();
    if (failure == null) {
      UserViewModel userViewModel = Provider.of<UserViewModel>(context);
      final failure = await userViewModel.fetchLastUser();
      if (failure == null && userViewModel.getLastUser() != null) {
        locator<Nav>().router.navigateTo(context, 'HomePage',
            clearStack: true, transition: TransitionType.fadeIn);
      } else {
        locator<Nav>().router.navigateTo(context, 'AuthPage',
            clearStack: true, transition: TransitionType.fadeIn);
      }
    } else {
      locator<Nav>().exit();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('#### _SplashPageState - build');

    return Container();
  }
}
