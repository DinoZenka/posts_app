import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final int id;
  const PostDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Post details: $id')));
  }
}
