import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/RadioModel.dart';

Future<RadioModel> getRadio() async {
  Uri url = Uri.parse('https://mp3quran.net/api/v3/radios?language=ar');
  var response = await http.get(url);
  var json = jsonDecode(response.body);
  return RadioModel.fromJson(json);
}
