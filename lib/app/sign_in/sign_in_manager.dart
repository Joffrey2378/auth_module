import 'dart:async';

import 'package:auth_module/services/auth.dart';
import 'package:flutter/foundation.dart';

class SignInManager {
  SignInManager({@required this.isLoading, @required this.auth});

  final AuthBase auth;
  final ValueNotifier<bool> isLoading;

  Future<User> _signIn(Future<User> Function() signInMethod) async {
    try {
      isLoading.value = true;
      return await signInMethod();
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<User> signInWithGoogle() => _signIn(auth.signInWithGoogle);
  Future<User> signInAnonymously() => _signIn(auth.signInAnonymously);
}
