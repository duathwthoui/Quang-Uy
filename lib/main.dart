import 'package:flutter/material.dart';
import 'package:newsapp/services/api_service.dart';
import 'package:newsapp/model/article_model.dart';

import 'components/customListTile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Flutter",
            style: TextStyle(color:Colors.black87 , fontWeight: FontWeight.w600),
          ),
          Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
          ),
        ],
      ),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.share,))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,

      ),


      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {

          if (snapshot.hasData) {
            var data = snapshot.data as List<Article>;
            return ListView.builder(

              itemCount: data.length,
              itemBuilder: (context, index) =>
                  customListTile(data[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}


