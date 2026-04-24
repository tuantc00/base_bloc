// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:clean_architecture_bloc/common/network/dio_client.dart' as _i2;
import 'package:clean_architecture_bloc/core/di/core_module.dart' as _i1;
import 'package:clean_architecture_bloc/features/comment/data/datasources/comment_remote_data_source.dart'
    as _i25;
import 'package:clean_architecture_bloc/features/comment/di/comment_module.dart'
    as _i24;
import 'package:clean_architecture_bloc/features/comment/domain/repositories/comment_repository.dart'
    as _i26;
import 'package:clean_architecture_bloc/features/comment/domain/usecases/create_comment_usecase.dart'
    as _i28;
import 'package:clean_architecture_bloc/features/comment/domain/usecases/delete_comment_usecase.dart'
    as _i29;
import 'package:clean_architecture_bloc/features/comment/domain/usecases/get_comments_usecase.dart'
    as _i27;
import 'package:clean_architecture_bloc/features/comment/presentation/bloc/comment_bloc.dart'
    as _i30;
import 'package:clean_architecture_bloc/features/post/data/datasources/post_remote_data_source.dart'
    as _i17;
import 'package:clean_architecture_bloc/features/post/di/post_module.dart'
    as _i16;
import 'package:clean_architecture_bloc/features/post/domain/repositories/post_repository.dart'
    as _i18;
import 'package:clean_architecture_bloc/features/post/domain/usecases/create_post_usecase.dart'
    as _i20;
import 'package:clean_architecture_bloc/features/post/domain/usecases/delete_post_usecase.dart'
    as _i23;
import 'package:clean_architecture_bloc/features/post/domain/usecases/get_posts_usecase.dart'
    as _i19;
import 'package:clean_architecture_bloc/features/post/domain/usecases/update_post_usecase.dart'
    as _i21;
import 'package:clean_architecture_bloc/features/post/presentation/bloc/post_bloc.dart'
    as _i22;
import 'package:clean_architecture_bloc/features/todo/data/datasources/todo_remote_data_source.dart'
    as _i9;
import 'package:clean_architecture_bloc/features/todo/di/todo_module.dart'
    as _i8;
import 'package:clean_architecture_bloc/features/todo/domain/repositories/todo_repository.dart'
    as _i10;
import 'package:clean_architecture_bloc/features/todo/domain/usecases/create_todo_usecase.dart'
    as _i12;
import 'package:clean_architecture_bloc/features/todo/domain/usecases/delete_todo_usecase.dart'
    as _i15;
import 'package:clean_architecture_bloc/features/todo/domain/usecases/get_todos_usecase.dart'
    as _i11;
import 'package:clean_architecture_bloc/features/todo/domain/usecases/update_todo_usecase.dart'
    as _i13;
import 'package:clean_architecture_bloc/features/todo/presentation/bloc/todo_bloc.dart'
    as _i14;
import 'package:clean_architecture_bloc/features/user/data/datasources/user_remote_data_source.dart'
    as _i4;
import 'package:clean_architecture_bloc/features/user/di/user_module.dart'
    as _i3;
import 'package:clean_architecture_bloc/features/user/domain/repositories/user_repository.dart'
    as _i5;
import 'package:clean_architecture_bloc/features/user/domain/usecases/create_user_usecase.dart'
    as _i7;
import 'package:clean_architecture_bloc/features/user/domain/usecases/delete_user_usecase.dart'
    as _i32;
import 'package:clean_architecture_bloc/features/user/domain/usecases/get_users_usecase.dart'
    as _i6;
import 'package:clean_architecture_bloc/features/user/domain/usecases/update_user_usecase.dart'
    as _i31;
import 'package:clean_architecture_bloc/features/user/presentation/bloc/user_bloc.dart'
    as _i33;
import 'package:dio/dio.dart' as _i34;
import 'package:get_it/get_it.dart' as _i35;
import 'package:injectable/injectable.dart' as _i36;

// initializes the registration of main-scope dependencies inside of GetIt
extension GetItInjectableX on _i35.GetIt {
  Future<_i35.GetIt> init({
    String? environment,
    _i36.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i36.GetItHelper(this, environment, environmentFilter);
    final coreModule = _$CoreModule();
    final userModule = _$UserModule();
    final todoModule = _$TodoModule();
    final postModule = _$PostModule();
    final commentModule = _$CommentModule();
    gh.lazySingleton<_i34.Dio>(() => coreModule.dio());
    gh.lazySingleton<_i2.DioClient>(
      () => coreModule.dioClient(gh<_i34.Dio>()),
    );
    gh.lazySingleton<_i4.UserRemoteDataSource>(
      () => userModule.userRemoteDataSource(gh<_i2.DioClient>()),
    );
    gh.lazySingleton<_i5.UserRepository>(
      () => userModule.userRepository(gh<_i4.UserRemoteDataSource>()),
    );
    gh.lazySingleton<_i6.GetUsersUseCase>(
      () => userModule.getUsersUseCase(gh<_i5.UserRepository>()),
    );
    gh.lazySingleton<_i7.CreateUserUseCase>(
      () => userModule.createUserUseCase(gh<_i5.UserRepository>()),
    );
    gh.lazySingleton<_i31.UpdateUserUseCase>(
      () => userModule.updateUserUseCase(gh<_i5.UserRepository>()),
    );
    gh.lazySingleton<_i32.DeleteUserUseCase>(
      () => userModule.deleteUserUseCase(gh<_i5.UserRepository>()),
    );
    gh.factory<_i33.UserBloc>(
      () => userModule.userBloc(
        gh<_i6.GetUsersUseCase>(),
        gh<_i7.CreateUserUseCase>(),
        gh<_i31.UpdateUserUseCase>(),
        gh<_i32.DeleteUserUseCase>(),
      ),
    );
    gh.lazySingleton<_i9.TodoRemoteDataSource>(
      () => todoModule.todoRemoteDataSource(gh<_i2.DioClient>()),
    );
    gh.lazySingleton<_i10.TodoRepository>(
      () => todoModule.todoRepository(gh<_i9.TodoRemoteDataSource>()),
    );
    gh.lazySingleton<_i11.GetTodoUseCase>(
      () => todoModule.getTodoUseCase(gh<_i10.TodoRepository>()),
    );
    gh.lazySingleton<_i12.CreateTodoUseCase>(
      () => todoModule.createTodoUseCase(gh<_i10.TodoRepository>()),
    );
    gh.lazySingleton<_i13.UpdateTodoUseCase>(
      () => todoModule.updateTodoUseCase(gh<_i10.TodoRepository>()),
    );
    gh.lazySingleton<_i15.DeleteTodoUseCase>(
      () => todoModule.deleteTodoUseCase(gh<_i10.TodoRepository>()),
    );
    gh.factory<_i14.TodoBloc>(
      () => todoModule.todoBloc(
        gh<_i12.CreateTodoUseCase>(),
        gh<_i13.UpdateTodoUseCase>(),
        gh<_i15.DeleteTodoUseCase>(),
        gh<_i11.GetTodoUseCase>(),
      ),
    );
    gh.lazySingleton<_i17.PostRemoteDataSource>(
      () => postModule.postRemoteDataSource(gh<_i2.DioClient>()),
    );
    gh.lazySingleton<_i18.PostRepository>(
      () => postModule.postRepository(gh<_i17.PostRemoteDataSource>()),
    );
    gh.lazySingleton<_i19.GetPostsUseCase>(
      () => postModule.getPostsUseCase(gh<_i18.PostRepository>()),
    );
    gh.lazySingleton<_i20.CreatePostUseCase>(
      () => postModule.createPostUseCase(gh<_i18.PostRepository>()),
    );
    gh.lazySingleton<_i21.UpdatePostUseCase>(
      () => postModule.updatePostUseCase(gh<_i18.PostRepository>()),
    );
    gh.lazySingleton<_i23.DeletePostUseCase>(
      () => postModule.deletePostUseCase(gh<_i18.PostRepository>()),
    );
    gh.factory<_i22.PostBloc>(
      () => postModule.postBloc(
        gh<_i19.GetPostsUseCase>(),
        gh<_i20.CreatePostUseCase>(),
        gh<_i21.UpdatePostUseCase>(),
        gh<_i23.DeletePostUseCase>(),
      ),
    );
    gh.lazySingleton<_i25.CommentRemoteDataSource>(
      () => commentModule.commentRemoteDataSource(gh<_i2.DioClient>()),
    );
    gh.lazySingleton<_i26.CommentRepository>(
      () => commentModule.commentRepository(
        gh<_i25.CommentRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i27.GetCommentsUseCase>(
      () => commentModule.getCommentsUseCase(gh<_i26.CommentRepository>()),
    );
    gh.lazySingleton<_i28.CreateCommentUseCase>(
      () => commentModule.createCommentUseCase(gh<_i26.CommentRepository>()),
    );
    gh.lazySingleton<_i29.DeleteCommentUseCase>(
      () => commentModule.deleteCommentUseCase(gh<_i26.CommentRepository>()),
    );
    gh.factory<_i30.CommentBloc>(
      () => commentModule.commentBloc(
        gh<_i27.GetCommentsUseCase>(),
        gh<_i28.CreateCommentUseCase>(),
        gh<_i29.DeleteCommentUseCase>(),
      ),
    );
    return this;
  }
}

class _$CoreModule extends _i1.CoreModule {}

class _$UserModule extends _i3.UserModule {}

class _$TodoModule extends _i8.TodoModule {}

class _$PostModule extends _i16.PostModule {}

class _$CommentModule extends _i24.CommentModule {}
