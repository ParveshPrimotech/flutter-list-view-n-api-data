import 'package:flutter/material.dart';
import 'package:test_project/screens/details_screen.dart';
import 'package:test_project/utils/string_ext.dart';
import '../data/BlogData.dart';
import '../widgets/CircleProgress.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: const Text("Blogs")),
       body:  Container(
         padding: const EdgeInsets.all(0),
         child: FutureBuilder(
           future: BlogData.getPosts(),
           builder: (context, snapshot){
             if(snapshot.connectionState == ConnectionState.waiting){
               return const CircleProgress();
             }else if(snapshot.hasData){
               final posts = snapshot.data ?? [];
               return Expanded(
                 child: ListView.builder(
                     itemCount: posts.length,
                     itemBuilder: (context, index) {
                       final post = posts[index];
                       return ListTile(
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => DetailsScreen(
                                   clickedId: post.id?.toString() ?? "",
                                 )
                             ),
                           );
                         },
                         title: Text(
                           post.title?.capitalize() ?? "",
                           style: const TextStyle(
                               color: Colors.black87,
                               fontWeight: FontWeight.w600
                           ),
                         ),
                         subtitle: Text(
                           post.body?.capitalize() ?? "",
                           maxLines: 1,
                           overflow: TextOverflow.ellipsis,
                           style: const TextStyle(
                               color: Colors.black45,
                               fontWeight: FontWeight.w400
                           ),
                         ),
                         leading: Container(
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
                       );
                     }
                 ),
               );
             }else{
               return const Text(
                 "Nothing to show"
               );
             }
           },
         )
       )
     );
  }
}


