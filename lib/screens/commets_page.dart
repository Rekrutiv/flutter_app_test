import 'package:flutter/material.dart';
import 'package:flutter_app_test/services/users_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_test/screens/listofcomments.dart';

class UsersPage extends StatelessWidget {
  final int id;
  final UsersService usersService = UsersService();

  UsersPage({@required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => usersService.fetchcomments(id),
      catchError: (context, error) {
        print(error.toString());
      },
      child: MaterialApp(
        title: 'Flutter test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Listofcomments(),
      ),
    );
  }
}
