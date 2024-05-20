import 'package:go_router/go_router.dart';

void customNavigate(context, String routeName, {Object? extra}) {
  GoRouter.of(context).push(routeName, extra: extra);
}

void customReplacementNavigate(context, String routeName) {
  GoRouter.of(context).pushReplacement(routeName);
}
