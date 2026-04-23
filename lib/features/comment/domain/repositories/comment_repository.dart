import 'package:clean_architecture_bloc/common/network/api_result.dart';
import 'package:clean_architecture_bloc/features/comment/domain/entities/comment_entity.dart';

abstract class CommentRepository {
  Future<ApiResult<List<CommentEntity>>> getComments(int postId);

  Future<ApiResult<bool>> createComment(CommentEntity comment);

  Future<ApiResult<bool>> deleteComment(CommentEntity comment);
}
