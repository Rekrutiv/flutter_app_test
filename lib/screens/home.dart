import 'package:flutter/material.dart';
import 'package:flutter_app_test/models/Users.dart';
import 'package:flutter_app_test/screens/commets_page.dart';
import 'package:provider/provider.dart';
//import '../models/Comments.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Users> users = Provider.of<List<Users>>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Post request'),
        ),
        body: (users == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(users[index].userId.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                        )),
                    subtitle: Column(
                      children: <Widget>[
                        Text(users[index].id.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            )),
                        Text(users[index].title,
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            )),
                        Text(users[index].body,
                            style: TextStyle(
                              color: Colors.green,
                              backgroundColor: Colors.limeAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            )),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              UsersPage(id: users[index].id)));
                    },
                  );
                }));
  }
}
