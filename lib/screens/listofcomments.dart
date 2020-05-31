import 'package:flutter/material.dart';
import 'package:flutter_app_test/models/Comments.dart';
import 'package:provider/provider.dart';

class Listofcomments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Comments> commentslist = Provider.of<List<Comments>>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Comments request'),
        ),
        body: (commentslist == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: commentslist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(commentslist[index].postId.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                        )),
                    subtitle: Column(
                      children: <Widget>[
                        Text(commentslist[index].id.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            )),
                        Text(commentslist[index].name,
                            style: TextStyle(
                              color: Colors.lightGreen,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            )),
                        Text(commentslist[index].body,
                            style: TextStyle(
                              color: Colors.lightGreen,
                              backgroundColor: Colors.limeAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            )),
                      ],
                    ),
//                    onTap: () {
//                      Navigator.of(context).push(MaterialPageRoute(
//                          builder: (context) =>
//                              UsersPage(id: users[index].id)));
//                    },
                  );
                }));
  }
}
