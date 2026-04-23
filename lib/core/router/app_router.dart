import 'package:clean_architecture_bloc/core/router/app_route_extras.dart';
import 'package:clean_architecture_bloc/core/router/app_route_paths.dart';
import 'package:clean_architecture_bloc/features/post/presentation/screens/create_post_screen.dart';
import 'package:clean_architecture_bloc/features/post/presentation/screens/post_detail_screen.dart';
import 'package:clean_architecture_bloc/features/post/presentation/screens/post_list_screen.dart';
import 'package:clean_architecture_bloc/features/todo/presentation/screens/todo_list_screen.dart';
import 'package:clean_architecture_bloc/features/user/presentation/screens/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutePaths.users,
    routes: [
      GoRoute(
        path: AppRoutePaths.users,
        builder: (_, __) => const UserListScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.postListPattern,
        builder: (_, state) {
          final extra = _asOrNull<PostListRouteExtra>(state.extra);
          if (extra == null) {
            return const _RouteErrorScreen(
              message: 'Missing user context for post list route.',
            );
          }
          return PostListScreen(user: extra.user);
        },
      ),
      GoRoute(
        path: AppRoutePaths.todoListPattern,
        builder: (_, state) {
          final extra = _asOrNull<TodoListRouteExtra>(state.extra);
          if (extra == null) {
            return const _RouteErrorScreen(
              message: 'Missing user context for todo list route.',
            );
          }
          return ToDoListScreen(user: extra.user);
        },
      ),
      GoRoute(
        path: AppRoutePaths.createPostPattern,
        builder: (_, state) {
          final extra = _asOrNull<PostListRouteExtra>(state.extra);
          if (extra == null) {
            return const _RouteErrorScreen(
              message: 'Missing user context for create post route.',
            );
          }
          return CreatePostScreen(user: extra.user);
        },
      ),
      GoRoute(
        path: AppRoutePaths.postDetailPattern,
        builder: (_, state) {
          final extra = _asOrNull<PostDetailRouteExtra>(state.extra);
          if (extra == null) {
            return const _RouteErrorScreen(
              message: 'Missing post context for post detail route.',
            );
          }
          return PostDetailScreen(
            post: extra.post,
            user: extra.user,
          );
        },
      ),
      GoRoute(
        path: AppRoutePaths.editPostPattern,
        builder: (_, state) {
          final extra = _asOrNull<PostDetailRouteExtra>(state.extra);
          if (extra == null || extra.user == null) {
            return const _RouteErrorScreen(
              message: 'Missing user/post context for edit post route.',
            );
          }
          return CreatePostScreen(
            user: extra.user!,
            post: extra.post,
            mode: PostMode.update,
          );
        },
      ),
    ],
    errorBuilder: (_, __) => const _RouteErrorScreen(),
  );

  static T? _asOrNull<T>(Object? extra) {
    if (extra is T) return extra;
    return null;
  }
}

class _RouteErrorScreen extends StatelessWidget {
  const _RouteErrorScreen({
    this.message = 'Unable to open this screen. Please go back and try again.',
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Route error')),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
