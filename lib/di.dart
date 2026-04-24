import 'package:clean_architecture_bloc/common/network/dio_client.dart';
import 'package:clean_architecture_bloc/features/comment/data/datasources/comment_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/comment/data/repositories/comment_repository_impl.dart';
import 'package:clean_architecture_bloc/features/comment/domain/repositories/comment_repository.dart';
import 'package:clean_architecture_bloc/features/comment/domain/usecases/create_comment_usecase.dart';
import 'package:clean_architecture_bloc/features/comment/domain/usecases/delete_comment_usecase.dart';
import 'package:clean_architecture_bloc/features/comment/domain/usecases/get_comments_usecase.dart';
import 'package:clean_architecture_bloc/features/comment/presentation/bloc/comment_bloc.dart';
import 'package:clean_architecture_bloc/features/post/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/post/data/repositories/post_repository_impl.dart';
import 'package:clean_architecture_bloc/features/post/domain/repositories/post_repository.dart';
import 'package:clean_architecture_bloc/features/post/domain/usecases/create_post_usecase.dart';
import 'package:clean_architecture_bloc/features/post/domain/usecases/delete_post_usecase.dart';
import 'package:clean_architecture_bloc/features/post/domain/usecases/get_posts_usecase.dart';
import 'package:clean_architecture_bloc/features/post/domain/usecases/update_post_usecase.dart';
import 'package:clean_architecture_bloc/features/post/presentation/bloc/post_bloc.dart';
import 'package:clean_architecture_bloc/features/todo/data/datasources/todo_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:clean_architecture_bloc/features/todo/domain/repositories/todo_repository.dart';
import 'package:clean_architecture_bloc/features/todo/domain/usecases/create_todo_usecase.dart';
import 'package:clean_architecture_bloc/features/todo/domain/usecases/delete_todo_usecase.dart';
import 'package:clean_architecture_bloc/features/todo/domain/usecases/get_todos_usecase.dart';
import 'package:clean_architecture_bloc/features/todo/domain/usecases/update_todo_usecase.dart';
import 'package:clean_architecture_bloc/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:clean_architecture_bloc/features/user/data/datasources/user_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/user/data/repositories/user_repository_impl.dart';
import 'package:clean_architecture_bloc/features/user/domain/repositories/user_repository.dart';
import 'package:clean_architecture_bloc/features/user/domain/usecases/create_user_usecase.dart';
import 'package:clean_architecture_bloc/features/user/domain/usecases/delete_user_usecase.dart';
import 'package:clean_architecture_bloc/features/user/domain/usecases/get_users_usecase.dart';
import 'package:clean_architecture_bloc/features/user/domain/usecases/update_user_usecase.dart';
import 'package:clean_architecture_bloc/features/user/presentation/bloc/user_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: 'init', asExtension: true)
Future<void> initDi() async => getIt.init();

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() => Dio();

  @lazySingleton
  DioClient dioClient(Dio dio) => DioClient(dio);

  @lazySingleton
  UserRemoteDataSource userRemoteDataSource(DioClient dioClient) =>
      UserRemoteDataSourceImpl(dioClient);

  @lazySingleton
  TodoRemoteDataSource todoRemoteDataSource(DioClient dioClient) =>
      TodoRemoteDataSourceImpl(dioClient);

  @lazySingleton
  PostRemoteDataSource postRemoteDataSource(DioClient dioClient) =>
      PostRemoteDataSourceImpl(dioClient);

  @lazySingleton
  CommentRemoteDataSource commentRemoteDataSource(DioClient dioClient) =>
      CommentRemoteDataSourceImpl(dioClient);

  @lazySingleton
  UserRepository userRepository(UserRemoteDataSource remoteDataSource) =>
      UserRepositoryImpl(remoteDataSource: remoteDataSource);

  @lazySingleton
  TodoRepository todoRepository(TodoRemoteDataSource remoteDataSource) =>
      TodoRepositoryImpl(remoteDataSource: remoteDataSource);

  @lazySingleton
  PostRepository postRepository(PostRemoteDataSource remoteDataSource) =>
      PostRepositoryImpl(remoteDataSource: remoteDataSource);

  @lazySingleton
  CommentRepository commentRepository(
          CommentRemoteDataSource remoteDataSource) =>
      CommentRepositoryImpl(remoteDataSource: remoteDataSource);

  @lazySingleton
  GetUsersUseCase getUsersUseCase(UserRepository userRepository) =>
      GetUsersUseCase(userRepository);

  @lazySingleton
  CreateUserUseCase createUserUseCase(UserRepository userRepository) =>
      CreateUserUseCase(userRepository);

  @lazySingleton
  UpdateUserUseCase updateUserUseCase(UserRepository userRepository) =>
      UpdateUserUseCase(userRepository);

  @lazySingleton
  DeleteUserUseCase deleteUserUseCase(UserRepository userRepository) =>
      DeleteUserUseCase(userRepository);

  @lazySingleton
  GetTodoUseCase getTodoUseCase(TodoRepository todoRepository) =>
      GetTodoUseCase(todoRepository);

  @lazySingleton
  CreateTodoUseCase createTodoUseCase(TodoRepository todoRepository) =>
      CreateTodoUseCase(todoRepository);

  @lazySingleton
  UpdateTodoUseCase updateTodoUseCase(TodoRepository todoRepository) =>
      UpdateTodoUseCase(todoRepository);

  @lazySingleton
  DeleteTodoUseCase deleteTodoUseCase(TodoRepository todoRepository) =>
      DeleteTodoUseCase(todoRepository);

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

  UserBloc userBloc(
    GetUsersUseCase getUsersUseCase,
    CreateUserUseCase createUserUseCase,
    UpdateUserUseCase updateUserUseCase,
    DeleteUserUseCase deleteUserUseCase,
  ) =>
      UserBloc(
        getUsersUseCase: getUsersUseCase,
        createUserUseCase: createUserUseCase,
        updateUserUseCase: updateUserUseCase,
        deleteUserUseCase: deleteUserUseCase,
      );

  TodoBloc todoBloc(
    CreateTodoUseCase createTodoUseCase,
    UpdateTodoUseCase updateTodoUseCase,
    DeleteTodoUseCase deleteTodoUseCase,
    GetTodoUseCase getTodoUseCase,
  ) =>
      TodoBloc(
        createTodoUseCase: createTodoUseCase,
        updateTodoUseCase: updateTodoUseCase,
        deleteTodoUseCase: deleteTodoUseCase,
        getTodoUseCase: getTodoUseCase,
      );

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
