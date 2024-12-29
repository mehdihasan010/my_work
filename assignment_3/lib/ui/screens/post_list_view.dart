import 'package:flutter/material.dart';
import '../../data/models/post_model.dart';

class PostListView extends StatelessWidget {
  final List<Post> posts;

  const PostListView({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: Text(
              posts[index].title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(posts[index].body),
            leading: CircleAvatar(
              child: Text(
                posts[index].id.toString(),
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
        );
      },
    );
  }
}
