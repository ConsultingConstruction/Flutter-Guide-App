import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guide_app_flutter/controllers/guides_controller.dart';
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

  @override
  void initState() {
    super.initState();

    // * Get the JSON file
    getJSONGuides().then((data) {
      setState(() {
        guidesData = data;
      });
    });
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
            crossAxisCount: 5,
          ),
        ),
      ),
    );
  }

  /// Return a [Card] widget with [gesture detection] for each of the guides on
  /// the JSON object
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
                  ? AspectRatio(
                      aspectRatio: 3 / 2,
                      child: Image.memory(
                        base64Decode(
                            guidesData?.guides?[index].iconByteData ?? ""),
                        width: 250,
                        height: 250,
                      ),
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
