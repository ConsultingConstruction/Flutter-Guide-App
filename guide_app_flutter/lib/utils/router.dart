import 'package:auto_route/annotations.dart';
import 'package:guide_app_flutter/views/tools_view.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(path: "/tools", page: ToolsView, initial: true),
  ],
)
class $AppRouter {}
