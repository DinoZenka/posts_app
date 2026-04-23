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
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(postRepositoryProvider);
      return repo.getPosts();
    });
  }
}

@riverpod
Future<Post?> postDetails(Ref ref, int id) async {
  final posts = await ref.watch(postsProvider.future);
  return posts.where((p) => p.id == id).firstOrNull;
}
