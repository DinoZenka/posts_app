import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts_app/presentation/providers/posts_provider.dart';
import 'package:posts_app/presentation/screens/posts/widgets/list_error.dart';
import 'package:posts_app/presentation/screens/posts/widgets/list_item.dart';
import 'package:posts_app/presentation/widgets/faded_scroll.dart';

class PostsScreen extends ConsumerWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsProvider);

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final bottomOffset = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'Posts',
          style: textTheme.headlineMedium?.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
        backgroundColor: colorScheme.primary,
      ),
      body: postsAsync.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const Center(child: Text('No posts found.'));
          }
          return FadedScroll(
            stops: const [0, 0.05, 0.92, 1],
            child: RefreshIndicator.adaptive(
              onRefresh: () async {
                await ref.read(postsProvider.notifier).refreshPosts();
              },
              child: ListView.separated(
                padding: EdgeInsets.all(12).copyWith(bottom: bottomOffset + 12),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ListItem(post: posts[index], index: index);
                },
              ),
            ),
          );
        },
        error: (error, stackTrace) => ListError(
          onRefresh: () => ref.refresh(postsProvider),
          error: error.toString(),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
