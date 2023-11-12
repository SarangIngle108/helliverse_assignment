import 'package:flutter/material.dart';
import 'package:heliverse_assignment/features/filter_provider.dart';
import 'package:heliverse_assignment/filter_page.dart';
import 'package:heliverse_assignment/teams_page.dart';
import 'package:heliverse_assignment/widgets/userlist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teams"),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FilterPage()));
              },
              icon: Icon(Icons.filter_alt)
          ),
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TeamList()));
              },
              icon: Icon(Icons.accessibility_rounded)
          ),
        ],
      ),
      body: Column(
        children: [
          //search bar

          //listview builder with pagination

          Expanded(child: UsersList()),
        ],
      )
    );
  }
}
