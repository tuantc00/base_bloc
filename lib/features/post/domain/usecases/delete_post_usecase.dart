import 'package:flutter/foundation.dart' show immutable;
import 'package:clean_architecture_bloc/common/usecase/usecase.dart';
import 'package:clean_architecture_bloc/common/network/api_result.dart';
import 'package:clean_architecture_bloc/features/post/domain/entities/post_entity.dart';
import 'package:clean_architecture_bloc/features/post/domain/repositories/post_repository.dart';

@immutable
class DeletePostUseCase implements UseCase<bool, DeletePostParams> {
  final PostRepository postRepository;

  const DeletePostUseCase(this.postRepository);

  @override
  Future<ApiResult<bool>> call(DeletePostParams params) async {
    return await postRepository.deletePost(params.post);
  }
}

@immutable
class DeletePostParams {
  final PostEntity post;

  const DeletePostParams(this.post);
}
