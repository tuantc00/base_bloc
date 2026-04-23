import 'package:clean_architecture_bloc/features/post/domain/entities/post_entity.dart';
import 'package:clean_architecture_bloc/features/user/domain/entities/user_entity.dart';

abstract class PostEvent {}

class PostFetched extends PostEvent {
  final UserEntity user;

  PostFetched(this.user);
}

class PostCreated extends PostEvent {
  final PostEntity post;

  PostCreated(this.post);
}

class PostUpdated extends PostEvent {
  final PostEntity post;

  PostUpdated(this.post);
}

class PostDeleted extends PostEvent {
  final PostEntity post;

  PostDeleted(this.post);
}
