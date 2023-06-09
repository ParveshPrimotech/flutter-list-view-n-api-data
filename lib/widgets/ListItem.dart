import 'package:flutter/material.dart';
import 'package:test_project/models/PostModel.dart';
import 'package:test_project/utils/string_ext.dart';

class ListItem extends StatelessWidget{

  const ListItem({super.key, required this.post, required this.index});

  final PostModel post;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width : 35,
                height : 35,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    (index+1).toString(),
                    style: const TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    post.title?.capitalize() ?? "",
                    style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600
                    ),
                  ),

                  Text(
                    post.body?.capitalize() ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(height:5),
        const Divider()
      ]
    );
  }
}