import 'package:clean_architecture_bloc/common/network/api_result.dart';
import 'package:clean_architecture_bloc/common/repository/repository_helper.dart';
import 'package:clean_architecture_bloc/features/post/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/post/data/models/post.dart';
import 'package:clean_architecture_bloc/features/post/domain/entities/post_entity.dart';
import 'package:clean_architecture_bloc/features/post/domain/repositories/post_repository.dart';
import 'package:clean_architecture_bloc/features/user/data/models/user.dart';
import 'package:clean_architecture_bloc/features/user/domain/entities/user_entity.dart';

class PostRepositoryImpl extends PostRepository with RepositoryHelper<Post> {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<List<PostEntity>>> getPosts(UserEntity user) async {
    return checkItemsFailOrSuccess(
      remoteDataSource.getUsers(User.fromEntity(user)),
    );
  }

  @override
  Future<ApiResult<bool>> createPost(PostEntity post) async {
    return checkItemFailOrSuccess(
      remoteDataSource.createPost(Post.fromEntity(post)),
    );
  }

  @override
  Future<ApiResult<bool>> updatePost(PostEntity post) async {
    return checkItemFailOrSuccess(
      remoteDataSource.updatePost(Post.fromEntity(post)),
    );
  }

  @override
  Future<ApiResult<bool>> deletePost(PostEntity post) async {
    return checkItemFailOrSuccess(
      remoteDataSource.deletePost(Post.fromEntity(post)),
    );
  }
}
