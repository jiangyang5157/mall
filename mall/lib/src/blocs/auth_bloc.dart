import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'blocs.dart';

class AuthBloc implements BlocBase {
  AuthBloc() {
    print('#### New instance of ${this} created');
  }

  @override
  void dispose() {}
}