import 'dart:convert';
import 'package:flutter/services.dart';

Future<dynamic> readJsonAssetFile(List items, String fileName) async {
  final String response = await rootBundle.loadString(fileName);
  final data = await jsonDecode(response);
  return (data);
}
