import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  final String? title, image;
  const News({super.key, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 350,
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: FancyShimmerImage(
                        boxFit: BoxFit.cover, imageUrl: image ?? '')
                        )
                        ),
                        const SizedBox(
                          width: 10,),
                  Expanded(
                    child: Text(
                      title ?? '',
                      maxLines:2, 
                      overflow:TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    )
                    )
                    ],
                ),
            );
  }
}