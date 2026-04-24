import 'package:clean_architecture_bloc/common/network/dio_client.dart';
import 'package:clean_architecture_bloc/features/todo/data/datasources/todo_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:clean_architecture_bloc/features/todo/domain/repositories/todo_repository.dart';
import 'package:clean_architecture_bloc/features/todo/domain/usecases/create_todo_usecase.dart';
import 'package:clean_architecture_bloc/features/todo/domain/usecases/delete_todo_usecase.dart';
import 'package:clean_architecture_bloc/features/todo/domain/usecases/get_todos_usecase.dart';
import 'package:clean_architecture_bloc/features/todo/domain/usecases/update_todo_usecase.dart';
import 'package:clean_architecture_bloc/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:injectable/injectable.dart';

@module
abstract class TodoModule {
  @lazySingleton
  TodoRemoteDataSource todoRemoteDataSource(DioClient dioClient) =>
      TodoRemoteDataSourceImpl(dioClient);

  @lazySingleton
  TodoRepository todoRepository(TodoRemoteDataSource remoteDataSource) =>
      TodoRepositoryImpl(remoteDataSource: remoteDataSource);

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
}
