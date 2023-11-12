import 'package:flutter/material.dart';
import 'package:heliverse_assignment/models/UserModel.dart';

class UserCard extends StatefulWidget {
  final UserModel user;
  const UserCard({Key? key, required this.user,}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return
       Card(
        child: Container(
          child:  Column(
            children: [
              Row(
                children: [
       /*   CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user.avatar ??'https://www.google.com/search?q=network+image+for+user&sca_esv=581504967&tbm=isch&sxsrf=AM9HkKlJWo4edYPglYnwROOg7Y_AfbZW5w:1699704579401&source=lnms&sa=X&ved=2ahUKEwjZkbb99LuCAxVHe2wGHbQhBVwQ_AUoAnoECAIQBA&biw=1536&bih=707&dpr=1.25#vhid=KzeIj9Eu9W6G-M&vssid=3981:EyMdVHNGeC4EHM'),
          ),*/
          Text(widget.user.firstName ?? "Name"),
          SizedBox(width: 10,),
          Text(widget.user.lastName ?? "Surname"),
              ],
              ),
            ],
          ),
        ),
      );

  }
}
