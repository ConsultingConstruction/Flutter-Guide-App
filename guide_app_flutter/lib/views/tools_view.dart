import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:guide_app_flutter/controllers/tools_controller.dart';
import 'package:guide_app_flutter/models/tools.dart';
import 'package:auto_route/auto_route.dart';
import 'package:guide_app_flutter/utils/router.gr.dart';

class ToolsView extends StatefulWidget {
  const ToolsView({
    Key? key,
    @PathParam('guideId') this.guideId,
  }) : super(key: key);

  final int? guideId;
  @override
  _ToolsViewState createState() => _ToolsViewState();
}

class _ToolsViewState extends State<ToolsView> {
  Tools? toolsData;
  @override
  void initState() {
    super.initState();

    // * Get the JSON file
    getJSONTools(widget.guideId).then((data) {
      setState(() {
        toolsData = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tools'),
          centerTitle: true,
        ),
        body: GridView.builder(
          itemBuilder: itemBuilder,
          itemCount: toolsData?.tools?.length ?? 0,
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
        context.pushRoute(DescriptionViewRoute(
            toolId: toolsData?.tools?[index].id, guideId: widget.guideId));
      },
      child: Card(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              toolsData?.tools?[index].iconByteData != null
                  ? AspectRatio(
                      aspectRatio: 3 / 2,
                      child: Image.memory(
                        base64Decode(
                            toolsData?.tools?[index].iconByteData ?? ""),
                      ),
                    )
                  : const SizedBox(),
              Text(
                toolsData?.tools?[index].toolName ?? "",
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
