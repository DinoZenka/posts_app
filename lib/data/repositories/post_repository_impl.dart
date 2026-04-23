import 'package:posts_app/data/datasources/remote/post_remote_data_source.dart';
import 'package:posts_app/domain/entities/post.dart';
import 'package:posts_app/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource _remoteDataSource;

  PostRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Post>> getPosts() async {
    final remotePosts = await _remoteDataSource.getPosts();
    return remotePosts.map((dto) => dto.toEntity()).toList();
  }
}
