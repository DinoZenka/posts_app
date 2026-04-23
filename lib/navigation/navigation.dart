import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:posts_app/presentation/screens/post_details/post_details.dart';
import 'package:posts_app/presentation/screens/posts/posts_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return PostsScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details/:id',
          builder: (BuildContext context, GoRouterState state) {
            final int postId = int.parse(state.pathParameters['id']!);
            return PostDetails(id: postId);
          },
        ),
      ],
    ),
  ],
);
