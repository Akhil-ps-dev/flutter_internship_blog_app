import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final String authorName;
  final String profilePic;
  const BlogCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.authorName,
    required this.profilePic,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
            ),
            const Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  profilePic,
                ),
              ),
              title: Text(authorName),
            )
          ],
        ),
      ),
    );
  }
}
