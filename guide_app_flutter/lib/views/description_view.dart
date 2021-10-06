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
          body: Container()),
    );
  }
}
