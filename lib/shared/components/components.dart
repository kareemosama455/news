// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

Widget buildNewsItem(article,BuildContext context) => Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(maxHeight: 130, maxWidth: 130),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage("${article['urlToImage']}"),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    '${article['title']}',
                     style:Theme.of(context).textTheme.bodyLarge,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )),
                  Text(
                    '${article['publishedAt']}',
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

Widget separatorItem() =>
    const Divider(height: 1, thickness: 1, color: Colors.grey);
