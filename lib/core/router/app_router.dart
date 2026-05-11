import 'package:go_router/go_router.dart';
import 'package:tp_supermercado/screens/addProduct_screen.dart';
import 'package:tp_supermercado/screens/calc_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/addProduct',
  routes: [
    GoRoute(path: '/addProduct', builder: (context, state) => const AddProductScreen()),
    GoRoute(path: '/calc', builder: (context, state) => const CalcScreen()),
  ]
);