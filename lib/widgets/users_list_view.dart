import 'package:flutter/material.dart';
import 'package:heliverse_assignment/models/UserModel.dart';
import 'package:heliverse_assignment/widgets/user_card.dart';

class UsersListView extends StatefulWidget {
 final List<UserModel> usersList;
  const UsersListView({Key? key, required this.usersList}) : super(key: key);

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.usersList.length,
        itemBuilder: (context,index){
          return UserCard(user: widget.usersList[index]);
        }
    );
  }
}

