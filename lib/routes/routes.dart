import 'package:auto_route/auto_route.dart';
import '../routes/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
            page: LoginRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeft,
            initial: true,
            durationInMilliseconds: 500),
        CustomRoute(
            page: SignUpRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 500),
      ];
}
