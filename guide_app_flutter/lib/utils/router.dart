import 'package:auto_route/annotations.dart';
import 'package:guide_app_flutter/views/guides_view.dart';
import 'package:guide_app_flutter/views/tools_view.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(path: "/guides", page: GuidesView, initial: true),
    AutoRoute(path: "/guides/:guideId/tools", page: ToolsView),
  ],
)
class $AppRouter {}
