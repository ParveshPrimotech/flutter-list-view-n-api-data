import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/screens/details_screen.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  List<dynamic> products = [];

  _HomeScreenState(){
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: const Text("List Screen")),
       body:  Container(
         padding: const EdgeInsets.all(0),
         child: Expanded(
           child: ListView.builder(
               itemCount: products.length,
               itemBuilder: (context, index) {
                 final product = products[index];
                 return ListTile(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => const DetailsScreen()
                       ),
                     );
                   },
                   title: Text("${product['title']}"),
                   subtitle: Text(product['category']),
                   leading: Container(
                     padding: const EdgeInsets.all(5),
                     child: Image.network(
                       product['image'],
                       width: 50,
                     ),
                   ),
                 );
               }
           ),
         )
       )
     );
  }

  fetchData() async{
    String url = "https://fakestoreapi.com/products";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    final body =  response.body ;
    final json = jsonDecode(body);
    setState(() {
      products = json;
    });
  }
}
