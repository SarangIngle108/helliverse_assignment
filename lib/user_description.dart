import 'package:flutter/material.dart';
import 'package:heliverse_assignment/models/UserModel.dart';

class UserDescription extends StatelessWidget {
  final UserModel user;
  const UserDescription({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                    backgroundImage: NetworkImage(user!.avatar!),
                  radius: 75,
                  //  : AssetImage('assets/images/teams.png'), // Use a placeholder image if imageUrl is nul
              ),
            ),
            SizedBox(height: 30,),
            Divider(),
            SizedBox(height: 10,),
            Text("First Name : ${user.firstName}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500 ),),
            SizedBox(height: 5,),
            Text("Last Name : ${user.lastName}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            SizedBox(height: 5,),
            Text("Gender : ${user.gender}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            SizedBox(height: 5,),
            Text("Email : ${user.email}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            SizedBox(height: 5,),
            Text("Domain : ${user.domain}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            SizedBox(height: 5,),


          ],
        ),
      ),
    );
  }
}
