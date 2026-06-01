import 'package:go_router/go_router.dart';
import 'package:tp_supermercado/entities/models.dart';
import 'package:tp_supermercado/screens/login_screen.dart';
import 'package:tp_supermercado/screens/add_product_screen.dart';
import 'package:tp_supermercado/screens/calc_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/addProduct', builder: (context, state) => const AddProductScreen()),
    GoRoute(
      path: '/calc',
      builder: (context, state) {
        final CalcData? calcData = state.extra as CalcData?;
        return CalcScreen(calcData: calcData);
      },
    ),
  ],
);