import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guide_app_flutter/controllers/description_controller.dart';
import 'package:guide_app_flutter/models/tool.dart';

class DescriptionView extends StatefulWidget {
  const DescriptionView(
      {Key? key,
      @PathParam('toolId') this.toolId,
      @PathParam('guideId') this.guideId})
      : super(key: key);

  final int? toolId;
  final int? guideId;
  @override
  _DescriptionViewState createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {
  Tool? toolData;
  int extraDescriptionCounter = -1;

  @override
  void initState() {
    super.initState();

    // * Get the JSON file
    getJSONDescription(widget.toolId).then((data) {
      setState(() {
        toolData = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(toolData?.toolName ?? "Tool"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Center(
              child: SizedBox(
                width: 500,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    toolData?.iconByteData != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Image.memory(
                              base64Decode(toolData?.iconByteData ?? ""),
                            ),
                          )
                        : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Text(
                        toolData?.steps ?? "Steps",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Text(toolData?.description ?? "Description"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: itemBuilder,
                        itemCount: toolData?.extraDescriptions?.length ?? 0,
                      ),
                    ),
                    const Divider(),
                    const Text("Example"),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: itemBuilder3,
                        itemCount: toolData?.images?.length ?? 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    extraDescriptionCounter++;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Text(
            toolData?.extraDescriptions?[index].title ?? "title",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Text(
              toolData?.extraDescriptions?[index].description ?? "description"),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: itemBuilder2,
          itemCount: toolData?.extraDescriptions?[index].images?.length ?? 0,
        ),
      ],
    );
  }

  Widget itemBuilder2(BuildContext context, int index) {
    return Image.memory(
      base64Decode(toolData?.extraDescriptions?[extraDescriptionCounter]
              .images?[index].imageByteData ??
          ""),
    );
  }

  Widget itemBuilder3(BuildContext context, int index) {
    return Image.memory(
      base64Decode(toolData?.images?[index].imageByteData ?? ""),
    );
  }
}
