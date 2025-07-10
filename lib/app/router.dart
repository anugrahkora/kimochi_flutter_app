import 'package:go_router/go_router.dart';
import 'package:kimochi_flutter_app/features/details/view/details_view.dart';
import 'package:kimochi_flutter_app/features/home/view/home_view.dart';
import 'package:kimochi_flutter_app/models/university.dart';

final appRouter = GoRouter(

  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      path: '/details',
      
     builder: (context, state) {
    final details = state.extra is University? state.extra as University: null;
    return DetailsView(universityDetails: details,);
  },
    ),
  ],
);