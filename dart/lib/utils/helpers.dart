import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showSnack(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}

String formatTimestamp(String? ts) {
  if (ts == null) return '';
  try {
    final dt = DateTime.parse(ts);
    return DateFormat.yMMMd().add_jm().format(dt.toLocal());
  } catch (_) {
    return ts;
  }
}
