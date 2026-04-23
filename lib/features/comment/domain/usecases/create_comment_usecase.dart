import 'package:flutter/foundation.dart' show immutable;
import 'package:clean_architecture_bloc/common/usecase/usecase.dart';
import 'package:clean_architecture_bloc/common/network/api_result.dart';
import 'package:clean_architecture_bloc/features/comment/domain/entities/comment_entity.dart';
import 'package:clean_architecture_bloc/features/comment/domain/repositories/comment_repository.dart';

@immutable
class CreateCommentUseCase implements UseCase<bool, CreateCommentParams> {
  final CommentRepository commentRepository;

  const CreateCommentUseCase(this.commentRepository);

  @override
  Future<ApiResult<bool>> call(CreateCommentParams params) async {
    return await commentRepository.createComment(params.comment);
  }
}

@immutable
class CreateCommentParams {
  final CommentEntity comment;

  const CreateCommentParams(this.comment);
}
