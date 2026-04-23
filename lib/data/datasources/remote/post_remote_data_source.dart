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
    await Future.delayed(const Duration(milliseconds: 1500));
    final response = await _dio.get('/posts');
    final List<dynamic> data = response.data;
    return data.map((json) => PostDto.fromJson(json)).toList();
  }
}
