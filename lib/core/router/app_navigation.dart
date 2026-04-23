import 'package:clean_architecture_bloc/core/router/app_route_extras.dart';
import 'package:clean_architecture_bloc/core/router/app_route_paths.dart';
import 'package:clean_architecture_bloc/features/post/domain/entities/post_entity.dart';
import 'package:clean_architecture_bloc/features/user/domain/entities/user_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension AppNavigation on BuildContext {
  Future<T?> pushPostList<T>(UserEntity user) {
    return push<T>(
      AppRoutePaths.postList(user.id!),
      extra: PostListRouteExtra(user: user),
    );
  }

  Future<T?> pushTodoList<T>(UserEntity user) {
    return push<T>(
      AppRoutePaths.todoList(user.id!),
      extra: TodoListRouteExtra(user: user),
    );
  }

  Future<T?> pushCreatePost<T>(UserEntity user) {
    return push<T>(
      AppRoutePaths.createPost(user.id!),
      extra: PostListRouteExtra(user: user),
    );
  }

  Future<T?> pushPostDetail<T>(UserEntity user, PostEntity post) {
    return push<T>(
      AppRoutePaths.postDetail(user.id!, post.id),
      extra: PostDetailRouteExtra(
        post: post,
        user: user,
      ),
    );
  }

  Future<T?> pushEditPost<T>(UserEntity user, PostEntity post) {
    return push<T>(
      AppRoutePaths.editPost(user.id!, post.id),
      extra: PostDetailRouteExtra(
        post: post,
        user: user,
      ),
    );
  }
}
