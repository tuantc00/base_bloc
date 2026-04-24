// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:clean_architecture_bloc/common/network/dio_client.dart' as _i9;
import 'package:clean_architecture_bloc/di.dart' as _i1;
import 'package:clean_architecture_bloc/features/comment/data/datasources/comment_remote_data_source.dart'
    as _i10;
import 'package:clean_architecture_bloc/features/comment/data/repositories/comment_repository_impl.dart'
    as _i12;
import 'package:clean_architecture_bloc/features/comment/domain/repositories/comment_repository.dart'
    as _i11;
import 'package:clean_architecture_bloc/features/comment/domain/usecases/create_comment_usecase.dart'
    as _i26;
import 'package:clean_architecture_bloc/features/comment/domain/usecases/delete_comment_usecase.dart'
    as _i28;
import 'package:clean_architecture_bloc/features/comment/domain/usecases/get_comments_usecase.dart'
    as _i24;
import 'package:clean_architecture_bloc/features/comment/presentation/bloc/comment_bloc.dart'
    as _i32;
import 'package:clean_architecture_bloc/features/post/data/datasources/post_remote_data_source.dart'
    as _i14;
import 'package:clean_architecture_bloc/features/post/data/repositories/post_repository_impl.dart'
    as _i16;
import 'package:clean_architecture_bloc/features/post/domain/repositories/post_repository.dart'
    as _i15;
import 'package:clean_architecture_bloc/features/post/domain/usecases/create_post_usecase.dart'
    as _i22;
import 'package:clean_architecture_bloc/features/post/domain/usecases/delete_post_usecase.dart'
    as _i27;
import 'package:clean_architecture_bloc/features/post/domain/usecases/get_posts_usecase.dart'
    as _i19;
import 'package:clean_architecture_bloc/features/post/domain/usecases/update_post_usecase.dart'
    as _i25;
import 'package:clean_architecture_bloc/features/post/presentation/bloc/post_bloc.dart'
    as _i31;
import 'package:clean_architecture_bloc/features/todo/data/datasources/todo_remote_data_source.dart'
    as _i13;
import 'package:clean_architecture_bloc/features/todo/data/repositories/todo_repository_impl.dart'
    as _i18;
import 'package:clean_architecture_bloc/features/todo/domain/repositories/todo_repository.dart'
    as _i17;
import 'package:clean_architecture_bloc/features/todo/domain/usecases/create_todo_usecase.dart'
    as _i21;
import 'package:clean_architecture_bloc/features/todo/domain/usecases/delete_todo_usecase.dart'
    as _i29;
import 'package:clean_architecture_bloc/features/todo/domain/usecases/get_todos_usecase.dart'
    as _i20;
import 'package:clean_architecture_bloc/features/todo/domain/usecases/update_todo_usecase.dart'
    as _i23;
import 'package:clean_architecture_bloc/features/todo/presentation/bloc/todo_bloc.dart'
    as _i30;
import 'package:clean_architecture_bloc/features/user/data/datasources/user_remote_data_source.dart'
    as _i7;
import 'package:clean_architecture_bloc/features/user/data/repositories/user_repository_impl.dart'
    as _i8;
import 'package:clean_architecture_bloc/features/user/domain/repositories/user_repository.dart'
    as _i6;
import 'package:clean_architecture_bloc/features/user/domain/usecases/create_user_usecase.dart'
    as _i4;
import 'package:clean_architecture_bloc/features/user/domain/usecases/delete_user_usecase.dart'
    as _i5;
import 'package:clean_architecture_bloc/features/user/domain/usecases/get_users_usecase.dart'
    as _i2;
import 'package:clean_architecture_bloc/features/user/domain/usecases/update_user_usecase.dart'
    as _i3;
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
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i34.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i9.DioClient>(
      () => registerModule.dioClient(gh<_i34.Dio>()),
    );
    gh.lazySingleton<_i7.UserRemoteDataSource>(
      () => registerModule.userRemoteDataSource(gh<_i9.DioClient>()),
    );
    gh.lazySingleton<_i13.TodoRemoteDataSource>(
      () => registerModule.todoRemoteDataSource(gh<_i9.DioClient>()),
    );
    gh.lazySingleton<_i14.PostRemoteDataSource>(
      () => registerModule.postRemoteDataSource(gh<_i9.DioClient>()),
    );
    gh.lazySingleton<_i10.CommentRemoteDataSource>(
      () => registerModule.commentRemoteDataSource(gh<_i9.DioClient>()),
    );
    gh.lazySingleton<_i6.UserRepository>(
      () => registerModule.userRepository(gh<_i7.UserRemoteDataSource>()),
    );
    gh.lazySingleton<_i17.TodoRepository>(
      () => registerModule.todoRepository(gh<_i13.TodoRemoteDataSource>()),
    );
    gh.lazySingleton<_i15.PostRepository>(
      () => registerModule.postRepository(gh<_i14.PostRemoteDataSource>()),
    );
    gh.lazySingleton<_i11.CommentRepository>(
      () =>
          registerModule.commentRepository(gh<_i10.CommentRemoteDataSource>()),
    );
    gh.lazySingleton<_i2.GetUsersUseCase>(
      () => registerModule.getUsersUseCase(gh<_i6.UserRepository>()),
    );
    gh.lazySingleton<_i4.CreateUserUseCase>(
      () => registerModule.createUserUseCase(gh<_i6.UserRepository>()),
    );
    gh.lazySingleton<_i3.UpdateUserUseCase>(
      () => registerModule.updateUserUseCase(gh<_i6.UserRepository>()),
    );
    gh.lazySingleton<_i5.DeleteUserUseCase>(
      () => registerModule.deleteUserUseCase(gh<_i6.UserRepository>()),
    );
    gh.lazySingleton<_i20.GetTodoUseCase>(
      () => registerModule.getTodoUseCase(gh<_i17.TodoRepository>()),
    );
    gh.lazySingleton<_i21.CreateTodoUseCase>(
      () => registerModule.createTodoUseCase(gh<_i17.TodoRepository>()),
    );
    gh.lazySingleton<_i23.UpdateTodoUseCase>(
      () => registerModule.updateTodoUseCase(gh<_i17.TodoRepository>()),
    );
    gh.lazySingleton<_i29.DeleteTodoUseCase>(
      () => registerModule.deleteTodoUseCase(gh<_i17.TodoRepository>()),
    );
    gh.lazySingleton<_i19.GetPostsUseCase>(
      () => registerModule.getPostsUseCase(gh<_i15.PostRepository>()),
    );
    gh.lazySingleton<_i22.CreatePostUseCase>(
      () => registerModule.createPostUseCase(gh<_i15.PostRepository>()),
    );
    gh.lazySingleton<_i25.UpdatePostUseCase>(
      () => registerModule.updatePostUseCase(gh<_i15.PostRepository>()),
    );
    gh.lazySingleton<_i27.DeletePostUseCase>(
      () => registerModule.deletePostUseCase(gh<_i15.PostRepository>()),
    );
    gh.lazySingleton<_i24.GetCommentsUseCase>(
      () => registerModule.getCommentsUseCase(gh<_i11.CommentRepository>()),
    );
    gh.lazySingleton<_i26.CreateCommentUseCase>(
      () => registerModule.createCommentUseCase(gh<_i11.CommentRepository>()),
    );
    gh.lazySingleton<_i28.DeleteCommentUseCase>(
      () => registerModule.deleteCommentUseCase(gh<_i11.CommentRepository>()),
    );
    gh.factory<_i33.UserBloc>(
      () => registerModule.userBloc(
        gh<_i2.GetUsersUseCase>(),
        gh<_i4.CreateUserUseCase>(),
        gh<_i3.UpdateUserUseCase>(),
        gh<_i5.DeleteUserUseCase>(),
      ),
    );
    gh.factory<_i30.TodoBloc>(
      () => registerModule.todoBloc(
        gh<_i21.CreateTodoUseCase>(),
        gh<_i23.UpdateTodoUseCase>(),
        gh<_i29.DeleteTodoUseCase>(),
        gh<_i20.GetTodoUseCase>(),
      ),
    );
    gh.factory<_i31.PostBloc>(
      () => registerModule.postBloc(
        gh<_i19.GetPostsUseCase>(),
        gh<_i22.CreatePostUseCase>(),
        gh<_i25.UpdatePostUseCase>(),
        gh<_i27.DeletePostUseCase>(),
      ),
    );
    gh.factory<_i32.CommentBloc>(
      () => registerModule.commentBloc(
        gh<_i24.GetCommentsUseCase>(),
        gh<_i26.CreateCommentUseCase>(),
        gh<_i28.DeleteCommentUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i1.RegisterModule {}
