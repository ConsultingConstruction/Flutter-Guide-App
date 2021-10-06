import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:guide_app_flutter/models/tools.dart';

Future<Tools?> getJSONTools(int? guideId) async {
  // ! Code to generate base64 strings from files ////////////////////////////
  // final ibuffer =
  //     (await rootBundle.load("images/Slabs_b.png")).buffer.asUint8List();
  // final bufferEncode = base64Encode(ibuffer);
  // print(bufferEncode);
  // ! ///////////////////////////////////////////////////////////////////////

  try {
    // * Loads the JSON with the guides data
    final String response = await rootBundle.loadString('JSON/tools.json');

    // * Decode the string to a JSON object
    final data = await json.decode(response);

    // * Return the new JSON data object
    return Tools.fromJson(data);
  } catch (e) {
    return null;
  }
}
