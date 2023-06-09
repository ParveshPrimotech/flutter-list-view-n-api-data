import 'package:flutter/material.dart';
import 'package:test_project/data/BlogData.dart';
import 'package:test_project/widgets/CircleProgress.dart';
import "/utils/string_ext.dart";


class DetailsScreen extends StatefulWidget{
  const DetailsScreen({super.key,required this.clickedId});

  final String clickedId;

  @override
  State<StatefulWidget> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Read Blog"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder(
          future: BlogData.getPost(widget.clickedId),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const CircleProgress();
            }else if(snapshot.hasData){
              final postDetails = snapshot.data;
              return  Expanded(
                child: ListView(
                    children: [
                      Text(
                          postDetails?.title?.capitalize() ?? "",
                          style : const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87
                          )
                      ),
                      Container(height: 8),
                      const Divider(
                          thickness: 2
                      ),
                      Container(height: 8),
                      Text(
                        postDetails?.body?.capitalize() ?? "",
                        textAlign : TextAlign.justify,
                        style: const TextStyle(
                            color : Colors.black45
                        ),
                      ),
                      Container(height: 12),
                      Text(
                        postDetails?.body?.capitalize() ?? "",
                        textAlign : TextAlign.justify,
                        style: const TextStyle(
                            color : Colors.black45
                        ),
                      ),
                      Container(height: 12),
                      Text(
                        postDetails?.body?.capitalize() ?? "",
                        textAlign : TextAlign.justify,
                        style: const TextStyle(
                            color : Colors.black45
                        ),
                      ),
                      Container(height: 15),
                      InkWell(
                          onTap: (){
                            showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return CommentBottomSheet(
                                      postId : widget.clickedId
                                  );
                                });
                          },
                          child: Container(
                            height: 45,
                            width : double.infinity,
                            alignment: const Alignment(0, 0),
                            decoration :const BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: const Text(
                              "View Comments",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          )
                      )
                    ],
                  ),
              );
            } else{
              return const Text(
                  "Nothing to show"
              );
            }
          },
        ),
      )
    );
  }
}


class CommentBottomSheet extends StatefulWidget{

  const CommentBottomSheet({super.key, required this.postId});

  final String postId;

  @override
  State<StatefulWidget> createState() =>_CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'Comments',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),
          ),
          Container(height: 15),
          FutureBuilder(
              future: BlogData.getComments(widget.postId),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Container();
                }else if(snapshot.hasData){
                  final comments = snapshot.data ?? [];
                  return Expanded(
                      child: ListView.builder(
                          itemCount : comments.length,
                          itemBuilder: (context, index) {
                            final comment = comments[index];
                            return ListTile(
                              title: Text(
                                  comment.name?.capitalize() ?? "",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87
                                  ),
                              ),
                              subtitle: Text(
                                  comment.body?.capitalize() ?? "",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54
                                  ),
                              ),
                            );
                          }
                      )
                  );
                }else{
                  return const Expanded(
                      child: Center(
                        child: Text("No comments yet"),
                      )
                  );
                }
              },
          ),
          Container(height: 15)
        ],
      ),
    );
  }
}