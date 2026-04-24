import 'package:dio/dio.dart';
import 'package:posts_app/app_config.dart';
import 'package:posts_app/data/datasources/remote/post_remote_data_source.dart';
import 'package:posts_app/data/repositories/post_repository_impl.dart';
import 'package:posts_app/domain/repositories/post_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  return Dio(
    BaseOptions(
      baseUrl: AppConfig.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );
}

@Riverpod(keepAlive: true)
PostRemoteDataSource postRemoteDataSource(Ref ref) {
  return PostRemoteDataSourceImpl(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
PostRepository postRepository(Ref ref) {
  return PostRepositoryImpl(ref.watch(postRemoteDataSourceProvider));
}
