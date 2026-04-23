import 'package:clean_architecture_bloc/common/network/api_result.dart';
import 'package:clean_architecture_bloc/features/post/domain/entities/post_entity.dart';
import 'package:clean_architecture_bloc/features/user/domain/entities/user_entity.dart';

abstract class PostRepository {
  Future<ApiResult<List<PostEntity>>> getPosts(UserEntity user);

  Future<ApiResult<bool>> createPost(PostEntity post);

  Future<ApiResult<bool>> updatePost(PostEntity post);

  Future<ApiResult<bool>> deletePost(PostEntity post);
}
