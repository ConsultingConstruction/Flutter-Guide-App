import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:guide_app_flutter/models/guides.dart';

Future<Guides?> getJSONGuides() async {
  // ! Code to generate base64 strings from files ////////////////////////////
  // final ibuffer =
  //     (await rootBundle.load("images/ARCHICAD.png")).buffer.asUint8List();
  // final bufferEncode = base64Encode(ibuffer);
  // print(bufferEncode);
  // ! ///////////////////////////////////////////////////////////////////////

  try {
    // * Loads the JSON with the guides data
    final String response = await rootBundle.loadString('JSON/guides.json');

    // * Decode the string to a JSON object
    final data = await json.decode(response);

    // * Return the new JSON data object
    return Guides.fromJson(data);
  } catch (e) {
    return null;
  }
}
