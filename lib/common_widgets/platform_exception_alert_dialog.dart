import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'platform_alert_dialog.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  PlatformExceptionAlertDialog({
    @required String title,
    @required PlatformException exception,
  }) : super(
          title: title,
          content: _message(exception),
          defaultActionText: 'OK',
        );

  static String _message(PlatformException exception) {
    return _errors[exception.code] ?? exception.message;
  }

  static Map<String, String> _errors = {
    'ERROR_INVALID_EMAIL': 'The email address is badly formated.',
    'ERROR_WRONG_PASSWORD': 'Password is wrong.',
    'ERROR_USER_NOT_FOUND':
        'There is no user corresponding to the given email address, or user has been deleted.',
    'ERROR_USER_DISABLED': 'The user has been disabled',
    'ERROR_TOO_MANY_REQUESTS':
        'There is too many attempts to sign in as this user.',
    'ERROR_OPERATION_NOT_ALLOWED': 'Email & Password accounts are not enabled.',
    'ERROR_WEAK_PASSWORD': 'Password is not strong enough.',
    'ERROR_EMAIL_ALREADY_IN_USE':
        'Email is already in use by a different account.',
  };
}
