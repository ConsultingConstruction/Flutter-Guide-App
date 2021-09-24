import 'package:flutter/material.dart';

class ToolsView extends StatefulWidget {
  const ToolsView({Key? key}) : super(key: key);

  @override
  _ToolsViewState createState() => _ToolsViewState();
}

class _ToolsViewState extends State<ToolsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Tools'),
        centerTitle: true,
      ),
      body: Container(),
    ));
  }
}
