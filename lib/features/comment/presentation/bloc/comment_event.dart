import 'package:clean_architecture_bloc/features/comment/domain/entities/comment_entity.dart';

abstract class CommentEvent {}

class CommentFetched extends CommentEvent {
  final int postId;

  CommentFetched(this.postId);
}

class CommentCreated extends CommentEvent {
  final CommentEntity comment;

  CommentCreated(this.comment);
}

class CommentDeleted extends CommentEvent {
  final CommentEntity comment;

  CommentDeleted(this.comment);
}
