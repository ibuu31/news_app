import 'package:flutter/material.dart';

import '../api/api_service.dart';
import '../api/model.dart';
import 'custom_widget.dart';

class SourceName extends StatefulWidget {
  final String sourceName;

  SourceName({super.key, required this.sourceName});

  @override
  State<SourceName> createState() => _SourceNameState();
}

class _SourceNameState extends State<SourceName> {
  Api client = Api();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: client.filteredData(widget.sourceName),
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
    );
  }
}
