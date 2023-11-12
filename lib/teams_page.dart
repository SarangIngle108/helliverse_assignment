import 'package:flutter/material.dart';
import 'package:heliverse_assignment/user_description.dart';

import 'models/teams.dart';

class TeamList extends StatefulWidget {
  const TeamList({Key? key}) : super(key: key);

  @override
  State<TeamList> createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Team"),
      ),
      body: ListView.builder(
          itemCount: team.length,
          itemBuilder: (context,index){
            return Card(
              // Your existing user list UI
              child: ListTile(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDescription(user: team[index])));
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(team[index].avatar!),
                ),
                title: Text(
                  '${team[index].firstName} ${team[index].lastName}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(team[index].email ?? ''),
                    Text(
                      team[index].available == true
                          ? "Available"
                          : "Not Available",
                      style: TextStyle(
                        color: team[index].available == true
                            ? Colors.green[900]
                            : Colors.red,
                      ),
                    ),
                  ],
                ),
                trailing: team[index].available == true
                    ? TextButton(
                  onPressed: () {
                   setState(() {
                     team.remove(team[index]);
                   });
                  },
                  child: Text("remove"),
                )
                    : Text(""),
              ),
            );
          },
      ),
    );
  }
}
