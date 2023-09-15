import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import '../api/model.dart';
import '../components/custom_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Api client = Api();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MaterialApp(
        home: Scaffold(
          body: Center(
            child: FutureBuilder(
              future: client.fetchData(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  List<Articles> articles = snapshot.data;
                  return ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return customListTile(articles[index], context);
                      });
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
