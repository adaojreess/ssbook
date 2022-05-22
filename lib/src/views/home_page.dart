import 'package:flutter/material.dart';

import '../components/appbar/primary_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PrimaryAppBar(
            
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.android)),
                Tab(icon: Icon(Icons.cloud_download))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
