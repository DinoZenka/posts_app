import 'package:posts_app/domain/entities/post.dart';

abstract interface class PostRepository {
  Future<List<Post>> getPosts();
}
