import 'package:go_router/go_router.dart';
import 'package:ws_work/src/features/car/presentation/car_router.dart';
import 'package:ws_work/src/features/user/presentation/user_router.dart';
import 'package:ws_work/src/splash/splash_router.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: SplashRouter.route,
      builder: (context, state) => SplashRouter.page,
    ),
    GoRoute(
      path: UserRouter.route,
      builder: (context, state) => UserRouter.page,
    ),
    GoRoute(
      path: CarRouter.route,
      builder: (context, state) => CarRouter.page,
    ),
  ],
);
