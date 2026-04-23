import 'package:flutter/foundation.dart' show immutable;
import 'package:clean_architecture_bloc/common/usecase/usecase.dart';
import 'package:clean_architecture_bloc/common/network/api_result.dart';
import 'package:clean_architecture_bloc/features/comment/domain/entities/comment_entity.dart';
import 'package:clean_architecture_bloc/features/comment/domain/repositories/comment_repository.dart';

@immutable
class DeleteCommentUseCase implements UseCase<bool, DeleteCommentParams> {
  final CommentRepository commentRepository;

  const DeleteCommentUseCase(this.commentRepository);

  @override
  Future<ApiResult<bool>> call(DeleteCommentParams params) async {
    return await commentRepository.deleteComment(params.comment);
  }
}

@immutable
class DeleteCommentParams {
  final CommentEntity comment;

  const DeleteCommentParams(this.comment);
}
