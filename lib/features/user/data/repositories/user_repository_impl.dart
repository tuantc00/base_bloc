import 'package:clean_architecture_bloc/common/network/api_result.dart';
import 'package:clean_architecture_bloc/common/repository/repository_helper.dart';
import 'package:clean_architecture_bloc/features/user/data/datasources/user_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/user/data/models/user.dart';
import 'package:clean_architecture_bloc/features/user/domain/entities/user_entity.dart';
import 'package:clean_architecture_bloc/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository with RepositoryHelper<User> {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<List<UserEntity>>> getUsers({
    Gender? gender,
    UserStatus? status,
  }) async {
    return checkItemsFailOrSuccess(
        remoteDataSource.getUsers(gender: gender, status: status));
  }

  @override
  Future<ApiResult<bool>> createUser(UserEntity user) async {
    return checkItemFailOrSuccess(
      remoteDataSource.createUser(User.fromEntity(user)),
    );
  }

  @override
  Future<ApiResult<bool>> updateUser(UserEntity user) async {
    return checkItemFailOrSuccess(
      remoteDataSource.updateUser(User.fromEntity(user)),
    );
  }

  @override
  Future<ApiResult<bool>> deleteUser(UserEntity user) async {
    return checkItemFailOrSuccess(
      remoteDataSource.deleteUser(User.fromEntity(user)),
    );
  }
}
