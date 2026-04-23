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
            final String? idParam = state.pathParameters['id'];
            final int? postId = int.tryParse(idParam ?? '');
            if (postId == null) {
              return const Scaffold(
                body: Center(child: Text('Invalid post id')),
              );
            }
            return PostDetails(id: postId);
          },
        ),
      ],
    ),
  ],
);
