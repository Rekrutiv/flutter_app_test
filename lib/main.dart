import 'package:flutter/material.dart';
import 'package:flutter_app_test/screens/home.dart';
import 'package:flutter_app_test/services/users_services.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final UsersService usersService = UsersService();
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => usersService.fetchusers(),
      catchError: (context, error) {
        print(error.toString());
      },
      child: MaterialApp(
        title: 'Flutter test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}
