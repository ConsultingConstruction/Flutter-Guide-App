// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'package:guide_app_flutter/views/guides_view.dart' as _i3;
import 'package:guide_app_flutter/views/tools_view.dart' as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    GuidesViewRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.GuidesView());
    },
    ToolsViewRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<ToolsViewRouteArgs>(
          orElse: () =>
              ToolsViewRouteArgs(guideId: pathParams.optInt('guideId')));
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.ToolsView(key: args.key, guideId: args.guideId));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig('/#redirect',
            path: '/', redirectTo: '/guides', fullMatch: true),
        _i1.RouteConfig(GuidesViewRoute.name, path: '/guides'),
        _i1.RouteConfig(ToolsViewRoute.name, path: '/guides/:guideId/tools')
      ];
}

class GuidesViewRoute extends _i1.PageRouteInfo<void> {
  const GuidesViewRoute() : super(name, path: '/guides');

  static const String name = 'GuidesViewRoute';
}

class ToolsViewRoute extends _i1.PageRouteInfo<ToolsViewRouteArgs> {
  ToolsViewRoute({_i2.Key? key, int? guideId})
      : super(name,
            path: '/guides/:guideId/tools',
            args: ToolsViewRouteArgs(key: key, guideId: guideId),
            rawPathParams: {'guideId': guideId});

  static const String name = 'ToolsViewRoute';
}

class ToolsViewRouteArgs {
  const ToolsViewRouteArgs({this.key, this.guideId});

  final _i2.Key? key;

  final int? guideId;
}
