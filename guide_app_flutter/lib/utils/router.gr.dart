// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'package:guide_app_flutter/views/tools_view.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    ToolsViewRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.ToolsView());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig('/#redirect',
            path: '/', redirectTo: '/tools', fullMatch: true),
        _i1.RouteConfig(ToolsViewRoute.name, path: '/tools')
      ];
}

class ToolsViewRoute extends _i1.PageRouteInfo<void> {
  const ToolsViewRoute() : super(name, path: '/tools');

  static const String name = 'ToolsViewRoute';
}
