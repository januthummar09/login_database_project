import 'package:flutter/material.dart';

TextStyle textDeco({double? fontSize, Color? colore, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 20,
    color: colore ?? const Color(0xFF5c585a),
    fontWeight: fontWeight ?? FontWeight.w600,
  );
}
