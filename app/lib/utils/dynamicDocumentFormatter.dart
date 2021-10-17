import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DynamicDocumentFormatter extends MaskTextInputFormatter {
  static String maskA = "###.###.###-###";
  static String maskB = "###.###.###/####-##";

  DynamicDocumentFormatter({String initialText})
      : super(
            mask: maskA,
            filter: {"#": RegExp(r'[0-9]')},
            initialText: initialText);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length == 14) {
      updateMask(mask: maskA);
    }
    if (newValue.text.length == 15) {
      updateMask(mask: maskB);
    }

    return super.formatEditUpdate(oldValue, newValue);
  }
}
