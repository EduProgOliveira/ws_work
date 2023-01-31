import 'package:go_router/go_router.dart';
import 'features/car/presentation/car_router.dart';
import 'features/user/presentation/user_router.dart';
import 'splash/splash_router.dart';

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
