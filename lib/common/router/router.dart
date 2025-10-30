import 'package:go_router/go_router.dart';
import 'package:hms_mobile/common/router/router_path.dart';

import '../../screens/screens.dart';

GoRouter getRouterConfig(String initialLocation) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(path: RouterPath.root, redirect: (context, state) => RouterPath.splash),
      GoRoute(path: RouterPath.splash, builder: (context, state) => SplashScreen()),
      GoRoute(path: RouterPath.home, builder: (context, state) => Home()),
      GoRoute(path: RouterPath.login, builder: (context, state) => LoginScreen())
    ],
  );
}
