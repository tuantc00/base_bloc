import 'package:clean_architecture_bloc/features/post/domain/entities/post_entity.dart';
import 'package:clean_architecture_bloc/features/user/domain/entities/user_entity.dart';

class PostListRouteExtra {
  const PostListRouteExtra({required this.user});

  final UserEntity user;
}

class TodoListRouteExtra {
  const TodoListRouteExtra({required this.user});

  final UserEntity user;
}

class PostDetailRouteExtra {
  const PostDetailRouteExtra({
    required this.post,
    this.user,
  });

  final PostEntity post;
  final UserEntity? user;
}
