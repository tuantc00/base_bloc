import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:clean_architecture_bloc/di.dart';
import 'package:clean_architecture_bloc/core/app_theme.dart';
import 'package:clean_architecture_bloc/core/app_config.dart';
import 'package:clean_architecture_bloc/core/app_style.dart' show logger;
import 'package:clean_architecture_bloc/core/app_string.dart' show AppString;
import 'package:clean_architecture_bloc/core/router/app_router.dart';
import 'package:clean_architecture_bloc/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:clean_architecture_bloc/features/user/presentation/bloc/user_bloc.dart';
import 'package:clean_architecture_bloc/features/post/presentation/bloc/post_bloc.dart';
import 'package:clean_architecture_bloc/features/comment/presentation/bloc/comment_bloc.dart';

Future<void> main() async => await initApp();

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'asset/config/.env');

  await initDi();

  final backendFromEnv = dotenv.maybeGet('BACKEND')?.trim();
  const backendFromDefine = String.fromEnvironment(
    'BACKEND',
    defaultValue: AppString.gorestEnv,
  );
  final backend = BackendEnv.fromString(
    backendFromEnv != null && backendFromEnv.isNotEmpty
        ? backendFromEnv
        : backendFromDefine,
  );

  await ConfigLoader.load(backend);

  logger.i('Running with backend: ${ConfigLoader.currentEnv}');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (context) => getIt<UserBloc>()),
        BlocProvider<TodoBloc>(create: (context) => getIt<TodoBloc>()),
        BlocProvider<PostBloc>(create: (context) => getIt<PostBloc>()),
        BlocProvider<CommentBloc>(create: (context) => getIt<CommentBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightAppTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
