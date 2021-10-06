import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:guide_app_flutter/models/tool.dart';

Future<Tool?> getJSONDescription(int? tool) async {
  // ! Code to generate base64 strings from files ////////////////////////////
  // final ibuffer =
  //     (await rootBundle.load("images/Slabs_d_5.png")).buffer.asUint8List();
  // final bufferEncode = base64Encode(ibuffer);
  // print(bufferEncode);
  // ! ///////////////////////////////////////////////////////////////////////

  try {
    // * Loads the JSON with the guides data
    final String response = await rootBundle.loadString('JSON/tool_$tool.json');

    // * Decode the string to a JSON object
    final data = await json.decode(response);

    // * Return the new JSON data object
    return Tool.fromJson(data);
  } catch (e) {
    return null;
  }
}
