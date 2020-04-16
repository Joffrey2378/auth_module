import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_raised_button.dart';

class FormSubmitButton extends CustomRaisedButton {
  FormSubmitButton({
    @required String text,
    VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          color: Colors.orange,
          height: 44.0,
          borderRadius: 4.0,
          onPressed: onPressed,
        );
}
