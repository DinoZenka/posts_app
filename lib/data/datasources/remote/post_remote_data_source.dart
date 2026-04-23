import 'package:dio/dio.dart';
import 'package:posts_app/data/models/post_dto.dart';

abstract class PostRemoteDataSource {
  Future<List<PostDto>> getPosts();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final Dio _dio;

  PostRemoteDataSourceImpl(this._dio);

  @override
  Future<List<PostDto>> getPosts() async {
    final response = await _dio.get('/posts');
    final raw = response.data;
    if (raw is! List) {
      throw const FormatException('Expected a list response for /posts');
    }
    return raw.whereType<Map<String, dynamic>>().map(PostDto.fromJson).toList();
  }
}
