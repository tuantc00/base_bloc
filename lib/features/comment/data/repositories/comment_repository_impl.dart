import 'package:clean_architecture_bloc/common/network/api_result.dart';
import 'package:clean_architecture_bloc/common/repository/repository_helper.dart';
import 'package:clean_architecture_bloc/features/comment/data/datasources/comment_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/comment/data/models/comment.dart';
import 'package:clean_architecture_bloc/features/comment/domain/entities/comment_entity.dart';
import 'package:clean_architecture_bloc/features/comment/domain/repositories/comment_repository.dart';

class CommentRepositoryImpl extends CommentRepository
    with RepositoryHelper<Comment> {
  final CommentRemoteDataSource remoteDataSource;

  CommentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<bool>> createComment(CommentEntity comment) async {
    return checkItemFailOrSuccess(
      remoteDataSource.createComment(Comment.fromEntity(comment)),
    );
  }

  @override
  Future<ApiResult<bool>> deleteComment(CommentEntity comment) async {
    return checkItemFailOrSuccess(
      remoteDataSource.deleteComment(Comment.fromEntity(comment)),
    );
  }

  @override
  Future<ApiResult<List<CommentEntity>>> getComments(int postId) async {
    return checkItemsFailOrSuccess(remoteDataSource.getComments(postId));
  }
}
