import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:helena_app/ui/features/auth/login/widgets/login_screen.dart";
import "package:helena_app/ui/features/splash/widgets/splash_screen.dart";

import "../ui/features/auth/signin/widgets/signin_screen.dart";

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: <RouteBase>[
    GoRoute(
      path: "/signin",
      name: "/signin",
      pageBuilder: (BuildContext context, GoRouterState state) =>
          CustomTransitionPage(
            key: state.pageKey,
            child: SigninScreen(),
            transitionDuration: Duration(milliseconds: 900),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(begin: Offset(-1.0, 0), end: Offset.zero)
                        .animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeInOutCubicEmphasized,
                      ),
                    ),
                    child: child,
                  );
                },
          ),
    ),
    GoRoute(
      path: "/login",
      name: "/login",
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: LoginScreen(),
          transitionDuration: Duration(milliseconds: 900),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(begin: Offset(1.0, 0), end: Offset.zero)
                  .animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInOutCubicEmphasized,
                    ),
                  ),
              child: child,
            );
          },
        );
      },
    ),

    GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) => SplashScreen(),
    ),
  ],
);
