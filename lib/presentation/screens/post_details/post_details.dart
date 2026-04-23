import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final String id;
  const PostDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Center(child: const Text('Post details'));
  }
}
