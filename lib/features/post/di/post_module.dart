import 'package:clean_architecture_bloc/common/network/dio_client.dart';
import 'package:clean_architecture_bloc/features/post/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/post/data/repositories/post_repository_impl.dart';
import 'package:clean_architecture_bloc/features/post/domain/repositories/post_repository.dart';
import 'package:clean_architecture_bloc/features/post/domain/usecases/create_post_usecase.dart';
import 'package:clean_architecture_bloc/features/post/domain/usecases/delete_post_usecase.dart';
import 'package:clean_architecture_bloc/features/post/domain/usecases/get_posts_usecase.dart';
import 'package:clean_architecture_bloc/features/post/domain/usecases/update_post_usecase.dart';
import 'package:clean_architecture_bloc/features/post/presentation/bloc/post_bloc.dart';
import 'package:injectable/injectable.dart';

@module
abstract class PostModule {
  @lazySingleton
  PostRemoteDataSource postRemoteDataSource(DioClient dioClient) =>
      PostRemoteDataSourceImpl(dioClient);

  @lazySingleton
  PostRepository postRepository(PostRemoteDataSource remoteDataSource) =>
      PostRepositoryImpl(remoteDataSource: remoteDataSource);

  @lazySingleton
  GetPostsUseCase getPostsUseCase(PostRepository postRepository) =>
      GetPostsUseCase(postRepository);

  @lazySingleton
  CreatePostUseCase createPostUseCase(PostRepository postRepository) =>
      CreatePostUseCase(postRepository);

  @lazySingleton
  UpdatePostUseCase updatePostUseCase(PostRepository postRepository) =>
      UpdatePostUseCase(postRepository);

  @lazySingleton
  DeletePostUseCase deletePostUseCase(PostRepository postRepository) =>
      DeletePostUseCase(postRepository);

  PostBloc postBloc(
    GetPostsUseCase getPostsUseCase,
    CreatePostUseCase createPostUseCase,
    UpdatePostUseCase updatePostUseCase,
    DeletePostUseCase deletePostUseCase,
  ) =>
      PostBloc(
        getPostsUseCase: getPostsUseCase,
        createPostUseCase: createPostUseCase,
        updatePostUseCase: updatePostUseCase,
        deletePostUseCase: deletePostUseCase,
      );
}
