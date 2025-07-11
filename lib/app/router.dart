import 'package:go_router/go_router.dart';
import 'package:kimochi_flutter_app/features/details/view/details_view.dart';
import 'package:kimochi_flutter_app/features/home/view/home_view.dart';
import 'package:kimochi_flutter_app/models/university.dart';

// Router configuration for the application

final appRouter = GoRouter(

  initialLocation: '/',
  routes: [
    // Home route
    GoRoute(
      path: '/',
      builder: (context, state) => HomeView(),
    ),
    // Details route, which takes a University object as extra data
    GoRoute(
      path: '/details',
      
     builder: (context, state) {
    final details = state.extra is University? state.extra as University: null;
    return DetailsView(universityDetails: details,);
  },
    ),
  ],
);