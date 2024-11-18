import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String image;
  final String title;
  final String summary;
  final VoidCallback onTap;

  const MovieCard({
    required this.image,
    required this.title,
    required this.summary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: image.isNotEmpty
                  ? Image.network(
                image,
                height: 120,
                width: 80,
                fit: BoxFit.cover,
              )
                  : Container(
                     height: 120,
                     width: 80,
                     color: Colors.grey,
                     child: Icon(
                       Icons.image_not_supported,
                       color: Colors.white,
                       size: 40,
                ),
              ),
            ),
            // Title and Summary
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Movie Title
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    // Movie Summary
                    Text(
                      summary.replaceAll(RegExp(r'<[^>]*>'),  ''),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[400],
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  }
