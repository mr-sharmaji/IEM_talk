import 'package:flutter/material.dart';
import 'package:iem_talk/pages/home.dart';
import 'package:iem_talk/widgets/header.dart';
import 'package:iem_talk/widgets/progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

final usersRef = Firestore.instance.collection('users');
List<dynamic> users = [];
enum ConfirmAction { CANCEL, ACCEPT }

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  void initState() {
    getUsers();
    super.initState();
  }

  getUsers() async {
    final QuerySnapshot snapshot = await usersRef.getDocuments();
    setState(() {
      users = snapshot.documents;
    });
  }


  Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign Out?'),
          content: const Text(
              'Are you sure you want to SignOut?'),
          actions: <Widget>[
            FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.CANCEL);
              },
            ),
            FlatButton(
              child: const Text('ACCEPT'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.ACCEPT);
                googleSignIn.signOut();
              },
            )
          ],
        );
      },
    );
  }

  choiceAction(String choice) {
    if (choice == 'Settings') {
      Fluttertoast.showToast(
          msg: "Comming Soon",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else if (choice == 'SignOut') {
      _asyncConfirmDialog(context);
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true, choiceAction: choiceAction),
      body: Text("Timeline"),
    );
  }
}
