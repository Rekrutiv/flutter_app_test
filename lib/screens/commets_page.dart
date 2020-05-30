import 'package:flutter/material.dart';
import 'package:flutter_app_test/models/Comments.dart';
import 'package:flutter_app_test/models/Users.dart';
import 'package:flutter_app_test/services/users_services.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatelessWidget {
  final int id;
  //final String name;
  final UsersService usersService = UsersService();

  UsersPage({@required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comment request $id'),),
      body: FutureProvider(
        create: (context) => usersService.fetchcomments(id),
        child:  Center(child: Consumer<Comments>(
          builder: (context, comments, widget) {
            return (comments !=null) ? Text(comments.toString())
            : CircularProgressIndicator();
          },
        )
        ,),
      )
    );
  }
}