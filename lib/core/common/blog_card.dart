import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
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
            const Text(
              'hello',
              style: TextStyle(
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
                imageUrl:
                    'https://cdn.vox-cdn.com/thumbor/zZoAiu108u_nJANa9GQq2pKaW5U=/0x0:1600x900/1200x800/filters:focal(672x322:928x578)/cdn.vox-cdn.com/uploads/chorus_image/image/68892629/cars_2.0.0.jpg',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'hello',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
            ),
            Divider(),
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.vox-cdn.com/thumbor/zZoAiu108u_nJANa9GQq2pKaW5U=/0x0:1600x900/1200x800/filters:focal(672x322:928x578)/cdn.vox-cdn.com/uploads/chorus_image/image/68892629/cars_2.0.0.jpg'),
              ),
              title: Text('hello'),
            ),
          ],
        ),
      ),
    );
  }
}
