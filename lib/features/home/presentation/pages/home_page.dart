import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mall/core/injection.dart';
import 'package:mall/core/util/localization/string_localization.dart';
import 'package:mall/core/util/nav.dart';
import 'package:mall/features/backend/data/models/user_model.dart';
import 'package:mall/features/backend/presentation/user_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    super.dispose();
    print('#### _HomePageState - dispose');
  }

  @override
  void initState() {
    super.initState();
    print('#### _HomePageState - initState');
  }

  @override
  Widget build(BuildContext context) {
    print('#### _HomePageState build');

    return Scaffold(
      appBar: AppBar(
        title: Text(string(context, 'title_home')),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: _buildDrawerList(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }

  List<Widget> _buildDrawerList(BuildContext context) {
    var ret = List<Widget>();
    ret.add(_buildDrawerHeader(context));
    ret.addAll(_buildDrawerMenu(context));
    return ret;
  }

  Widget _buildDrawerHeader(BuildContext context) {
    UserViewModel userViewModel = Provider.of<UserViewModel>(context);
    UserModel userModel = userViewModel.getLastUser();
    return UserAccountsDrawerHeader(
      accountName: Text(userModel.name),
      accountEmail: Text(userModel.emailAddress ?? ''),
      currentAccountPicture: GestureDetector(
        child: CircleAvatar(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  List<Widget> _buildDrawerMenu(BuildContext context) {
    var ret = List<Widget>();
    ret.add(
      ListTile(
        title: Text(string(context, 'label_settings')),
        trailing: Icon(Icons.settings),
        onTap: () async {
          locator<Nav>().router.pop(context);
          locator<Nav>().router.navigateTo(context, 'SettingsPage',
              transition: TransitionType.fadeIn);
        },
      ),
    );
    return ret;
  }
}
