import 'dart:async';

import 'package:posts_app/data/providers.dart';
import 'package:posts_app/domain/entities/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts_provider.g.dart';

@riverpod
class PostsNotifier extends _$PostsNotifier {
  @override
  Future<List<Post>> build() async {
    final repo = ref.watch(postRepositoryProvider);
    return repo.getPosts();
  }

  Future<void> refreshPosts() async {
    final repo = ref.read(postRepositoryProvider);
    final data = await repo.getPosts();

    state = AsyncData(data);
  }
}

@riverpod
Post? postDetails(Ref ref, int id) {
  final postsAsync = ref.watch(postsProvider);

  return postsAsync.value?.firstWhere(
    (post) => post.id == id,
    orElse: () => throw Exception('Post not found'),
  );
}
