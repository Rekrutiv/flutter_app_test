import 'package:flutter/material.dart';
import 'package:flutter_app_test/models/Users.dart';
import 'package:flutter_app_test/screens/commets_page.dart';
import 'package:provider/provider.dart';
//import '../models/Comments.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<Users> users = Provider.of<List<Users>>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Post request'),
      ),
      body: (users == null)
      ? Center(child: CircularProgressIndicator(),)
      : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context,index){
          return ListTile( 
            subtitle: Text(users[index].body),
            title: Text(users[index].title),
            onTap: () {
              Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => UsersPage(id: users[index].id)));
            },
          );
        })
    );
  }
}