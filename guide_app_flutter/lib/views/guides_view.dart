import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guide_app_flutter/models/guides.dart';
import 'package:guide_app_flutter/utils/router.gr.dart';

class GuidesView extends StatefulWidget {
  const GuidesView({Key? key}) : super(key: key);

  @override
  _GuidesViewState createState() => _GuidesViewState();
}

class _GuidesViewState extends State<GuidesView> {
  Guides? guidesData;

  Uint8List? image;

  getJSONGuides() async {
    // ! Code to generate base64 strings from files
    // final ibuffer =
    //     (await rootBundle.load("images/ARCHICAD.png")).buffer.asUint8List();
    // final bufferEncode = base64Encode(ibuffer);
    // print(bufferEncode);

    final String response = await rootBundle.loadString('JSON/guides.json');
    final data = await json.decode(response);
    setState(() {
      guidesData = Guides.fromJson(data);
    });
  }

  @override
  void initState() {
    super.initState();
    getJSONGuides();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Guides'),
          centerTitle: true,
        ),
        body: GridView.builder(
          itemBuilder: itemBuilder,
          itemCount: guidesData?.guides?.length ?? 0,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5),
        ),
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        context
            .pushRoute(ToolsViewRoute(guideId: guidesData?.guides?[index].id));
      },
      child: Card(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              guidesData?.guides?[index].iconByteData != null
                  ? Image.memory(
                      base64Decode(
                          guidesData?.guides?[index].iconByteData ?? ""),
                      width: 250,
                      height: 250,
                    )
                  : const SizedBox(),
              Text(
                guidesData?.guides?[index].guideName ?? "",
                textScaleFactor: 1.5,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
