import 'dart:async';

import 'package:auth_module/services/auth.dart';
import 'package:flutter/foundation.dart';

class SignInBloc {
  SignInBloc({@required this.auth});

  final AuthBase auth;

  final StreamController<bool> _isLoadingController = StreamController();

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  void dispose() => _isLoadingController.close();

  void _setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);

  Future<User> _signIn(Future<User> Function() signInMethod) async {
    try {
      _setIsLoading(true);
      return await signInMethod();
    } catch (e) {
      _setIsLoading(false);
      rethrow;
    }
  }

  Future<User> signInWithGoogle() => _signIn(auth.signInWithGoogle);
  Future<User> signInAnonymously() => _signIn(auth.signInAnonymously);
}
