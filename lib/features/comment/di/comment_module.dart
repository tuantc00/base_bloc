import 'package:clean_architecture_bloc/common/network/dio_client.dart';
import 'package:clean_architecture_bloc/features/comment/data/datasources/comment_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/comment/data/repositories/comment_repository_impl.dart';
import 'package:clean_architecture_bloc/features/comment/domain/repositories/comment_repository.dart';
import 'package:clean_architecture_bloc/features/comment/domain/usecases/create_comment_usecase.dart';
import 'package:clean_architecture_bloc/features/comment/domain/usecases/delete_comment_usecase.dart';
import 'package:clean_architecture_bloc/features/comment/domain/usecases/get_comments_usecase.dart';
import 'package:clean_architecture_bloc/features/comment/presentation/bloc/comment_bloc.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CommentModule {
  @lazySingleton
  CommentRemoteDataSource commentRemoteDataSource(DioClient dioClient) =>
      CommentRemoteDataSourceImpl(dioClient);

  @lazySingleton
  CommentRepository commentRepository(
          CommentRemoteDataSource remoteDataSource) =>
      CommentRepositoryImpl(remoteDataSource: remoteDataSource);

  @lazySingleton
  GetCommentsUseCase getCommentsUseCase(CommentRepository commentRepository) =>
      GetCommentsUseCase(commentRepository);

  @lazySingleton
  CreateCommentUseCase createCommentUseCase(
          CommentRepository commentRepository) =>
      CreateCommentUseCase(commentRepository);

  @lazySingleton
  DeleteCommentUseCase deleteCommentUseCase(
          CommentRepository commentRepository) =>
      DeleteCommentUseCase(commentRepository);

  CommentBloc commentBloc(
    GetCommentsUseCase getCommentsUseCase,
    CreateCommentUseCase createCommentUseCase,
    DeleteCommentUseCase deleteCommentUseCase,
  ) =>
      CommentBloc(
        getCommentsUseCase: getCommentsUseCase,
        createCommentUseCase: createCommentUseCase,
        deleteCommentUseCase: deleteCommentUseCase,
      );
}
