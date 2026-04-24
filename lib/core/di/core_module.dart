import 'package:clean_architecture_bloc/common/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CoreModule {
  @lazySingleton
  Dio dio() => Dio();

  @lazySingleton
  DioClient dioClient(Dio dio) => DioClient(dio);
}
