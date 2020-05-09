import 'package:flutter/material.dart';

const List<String> choices = <String>[
  'Settings',
  'SignOut'
];
AppBar header(context, {bool isAppTitle = false, String titleText,bool removeBackButton = false, choiceAction}) {
  return AppBar(
    automaticallyImplyLeading: removeBackButton ? false : true,
    title: Text(
      isAppTitle ? "IEM Talk" : titleText,
      style: TextStyle(
        color: Colors.white,
        fontFamily: isAppTitle ? "Signatra" : "",
        fontSize: isAppTitle ? 50.0 : 22.0,
      ),
    ),
    actions: <Widget>[
      PopupMenuButton<String>(
        onSelected: choiceAction,
        itemBuilder: (BuildContext context){
          return choices.map((String choice){
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      )
    ],
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}

//void choiceAction(String choice){
//  if(choice == 'Settings'){
//    print('Settings');
//  }else if(choice == 'Subscribe'){
//    print('Subscribe');
//  }else if(choice == 'SignOut'){
//    print('SignOut');
//  }
//}
