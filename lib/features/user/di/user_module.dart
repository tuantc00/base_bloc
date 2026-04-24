import 'package:clean_architecture_bloc/common/network/dio_client.dart';
import 'package:clean_architecture_bloc/features/user/data/datasources/user_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/user/data/repositories/user_repository_impl.dart';
import 'package:clean_architecture_bloc/features/user/domain/repositories/user_repository.dart';
import 'package:clean_architecture_bloc/features/user/domain/usecases/create_user_usecase.dart';
import 'package:clean_architecture_bloc/features/user/domain/usecases/delete_user_usecase.dart';
import 'package:clean_architecture_bloc/features/user/domain/usecases/get_users_usecase.dart';
import 'package:clean_architecture_bloc/features/user/domain/usecases/update_user_usecase.dart';
import 'package:clean_architecture_bloc/features/user/presentation/bloc/user_bloc.dart';
import 'package:injectable/injectable.dart';

@module
abstract class UserModule {
  @lazySingleton
  UserRemoteDataSource userRemoteDataSource(DioClient dioClient) =>
      UserRemoteDataSourceImpl(dioClient);

  @lazySingleton
  UserRepository userRepository(UserRemoteDataSource remoteDataSource) =>
      UserRepositoryImpl(remoteDataSource: remoteDataSource);

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
}
