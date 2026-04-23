import 'package:dio/dio.dart';
import 'package:posts_app/data/datasources/remote/post_remote_data_source.dart';
import 'package:posts_app/domain/entities/post.dart';
import 'package:posts_app/domain/failures/failure.dart';
import 'package:posts_app/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource _remoteDataSource;

  PostRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Post>> getPosts() async {
    try {
      final remotePosts = await _remoteDataSource.getPosts();
      return remotePosts.map((dto) => dto.toEntity()).toList();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw const NetworkFailure();
      } else if (e.response?.statusCode != null) {
        throw ServerFailure('Server error: ${e.response?.statusCode}');
      } else {
        throw const UnknownFailure();
      }
    } on TypeError {
      throw const ParsingFailure();
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }
}
