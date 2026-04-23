import 'package:flutter/foundation.dart' show immutable;
import 'package:clean_architecture_bloc/common/usecase/usecase.dart';
import 'package:clean_architecture_bloc/common/network/api_result.dart';
import 'package:clean_architecture_bloc/features/comment/domain/entities/comment_entity.dart';
import 'package:clean_architecture_bloc/features/comment/domain/repositories/comment_repository.dart';

@immutable
class GetCommentsUseCase
    implements UseCase<List<CommentEntity>, GetCommentsParams> {
  final CommentRepository commentRepository;

  const GetCommentsUseCase(this.commentRepository);

  @override
  Future<ApiResult<List<CommentEntity>>> call(GetCommentsParams params) async {
    return await commentRepository.getComments(params.postId);
  }
}

@immutable
class GetCommentsParams {
  final int postId;

  const GetCommentsParams({required this.postId});
}
