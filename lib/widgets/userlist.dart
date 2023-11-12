import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:heliverse_assignment/models/UserModel.dart';
import 'package:heliverse_assignment/user_description.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

import '../models/teams.dart';


class UsersList extends StatefulWidget {
  UsersList({Key? key}) : super(key: key);

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  late Future<List<UserModel>> _usersFuture;
  final _searchController = TextEditingController();
  final List<String> categories = [
    'Available',
    'Not Available',
    'Male',
    'Female',
    'Sales',
    'Marketing',
  ];
  var add = false;

  List<String> selectedCategories = [];
  final List<UserModel> flist = [];


  @override
  void initState() {
    super.initState();
    _usersFuture = loadJsonData();
  }

  Future<List<UserModel>> loadJsonData() async {
    final String jsonData = await rootBundle.loadString('assets/heliverse_mock_data.json');
    final data = json.decode(jsonData);
    List<UserModel> usersList = [];
    for (Map i in data) {
      usersList.add(UserModel.fromJson(i));
      flist.add(UserModel.fromJson(i));
    }
    return usersList;
  }


  List<UserModel> filterUsers(List<UserModel> users, String query) {
    if (query.isEmpty) {
      return users; // Return all users if the query is empty
    } else {
      return users.where((user) => user.firstName!.toLowerCase().contains(query.toLowerCase())).toList();
    }
  }

  @override
  Widget build(BuildContext context) {

    final filteredUsers = flist.where((user) {
      return selectedCategories.isEmpty || selectedCategories.contains(user.gender == "Male")
          || selectedCategories.contains(user.available == true) ;
    });
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: categories.map((category) =>
                    FilterChip(selected:selectedCategories.contains(category),label: Text(category), onSelected: (selected){
                      setState(() {
                        if(selected){
                          selectedCategories.add(category);
                        }else{
                          selectedCategories.remove(category);
                        }
                      });
                })).toList(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  // Update UI based on the search query
                  _usersFuture = loadJsonData(); // Fetch data again
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<UserModel>>(
              future: _usersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error loading data'));
                } else {
                  List<UserModel>? users = snapshot.data;
                  String query = _searchController.text;
                  List<UserModel> filteredUsers = filterUsers(users!, query);

                  return ListView.builder(
                    itemCount: flist.length,
                    itemBuilder: (context, index) {
                      return Card(
                        // Your existing user list UI
                        child: ListTile(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDescription(user: filteredUsers[index])));
                          },
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(flist[index].avatar!),
                          ),
                          title: Text(
                            '${filteredUsers[index].firstName} ${filteredUsers[index].lastName}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(filteredUsers[index].email ?? ''),
                              Text(
                                flist[index].available == true
                                    ? "Available"
                                    : "Not Available",
                                style: TextStyle(
                                  color: filteredUsers[index].available == true
                                      ? Colors.green[900]
                                      : Colors.red,
                                ),
                              ),
                            ],
                          ),
                          trailing: filteredUsers[index].available == true
                              ? TextButton(
                            onPressed: () {
                             setState(() {
                               team.add(filteredUsers[index]);

                             });
                            },
                            child:  Text("Add"),
                          )
                              : Text(""),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
