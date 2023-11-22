import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:networking/post.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Dio dio = Dio();
  List<Post> list = [];

  void load() async {
    try {
      var response =
          await dio.get("https://jsonplaceholder.typicode.com/posts");
      if (response.statusCode == 200) {
        setState(() {
          list = listFromJson(response.data);
        });
      }
    } catch (e) {
      print(e);
    }
  }


  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Networking"),
      ),
      body: ListView.builder(
          itemCount: list.length, itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              color: Colors.green[100],
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(list[index].userId.toString()),
                  SizedBox(height: 10,),
                  Text(list[index].id.toString()),
                  SizedBox(height: 10,),
                  Text(list[index].title.toString()),
                  SizedBox(height: 10,),
                  Text(list[index].body.toString()),
                ],
              ),
            );
      }),
    );
  }
}
