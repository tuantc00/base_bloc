import 'package:flutter/foundation.dart' show immutable;
import 'package:clean_architecture_bloc/common/usecase/usecase.dart';
import 'package:clean_architecture_bloc/common/network/api_result.dart';
import 'package:clean_architecture_bloc/features/post/domain/entities/post_entity.dart';
import 'package:clean_architecture_bloc/features/post/domain/repositories/post_repository.dart';
import 'package:clean_architecture_bloc/features/user/domain/entities/user_entity.dart';

@immutable
class GetPostsUseCase implements UseCase<List<PostEntity>, GetPostsParams> {
  final PostRepository postRepository;

  const GetPostsUseCase(this.postRepository);

  @override
  Future<ApiResult<List<PostEntity>>> call(GetPostsParams params) async {
    return await postRepository.getPosts(params.user);
  }
}

@immutable
class GetPostsParams {
  final UserEntity user;

  const GetPostsParams({required this.user});
}
