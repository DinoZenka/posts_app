import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts_app/presentation/providers/posts_provider.dart';
import 'package:posts_app/presentation/screens/post_details/widgets/metadata_badge.dart';
import 'package:posts_app/presentation/widgets/faded_scroll.dart';

class PostDetails extends ConsumerWidget {
  final int id;
  const PostDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsync = ref.watch(postDetailsProvider(id));

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final bottomOffset = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post Details',
          style: textTheme.headlineMedium?.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
        backgroundColor: colorScheme.primary,
        centerTitle: true,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
      ),
      body: postAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge,
            ),
          ),
        ),
        data: (post) {
          if (post == null) {
            return Center(
              child: Text(
                "Post with id $id not found",
                style: textTheme.bodyLarge,
              ),
            );
          }
          return FadedScroll(
            stops: const [0, 0.03, 0.92, 1],
            child: ListView(
              padding: EdgeInsets.all(16).copyWith(bottom: bottomOffset + 16),
              children: [
                MetadataBadge(userId: post.userId, postId: post.id),
                const SizedBox(height: 24),
                Text(post.title, style: textTheme.headlineMedium),
                const SizedBox(height: 16),
                Divider(color: colorScheme.outlineVariant, thickness: 1),
                const SizedBox(height: 16),
                Text(post.body, style: textTheme.bodyLarge),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Share Post'),
        icon: const Icon(Icons.share_rounded),
      ),
    );
  }
}
