import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/widgets/widgets.dart';
import 'package:flutter_facebook_ui/models/models.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  final Function(String) onPressed;

  const CreatePostContainer({this.currentUser, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              SizedBox(width: 12.0),
              Expanded(
                child: TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration.collapsed(
                    hintText: "What's on your mind?",
                    hintStyle: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          Divider(thickness: 0.5),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton.icon(
                    onPressed: onPressed("Live"),
                    icon: Icon(Icons.videocam, color: Colors.red),
                    label: Text(
                      "Live",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                FlatButton.icon(
                    onPressed: onPressed("Photo"),
                    icon: Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: Text(
                      "Photo",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                FlatButton.icon(
                    onPressed: onPressed("Room"),
                    icon: Icon(
                      Icons.videocam,
                      color: Colors.purple,
                    ),
                    label: Text(
                      "Room",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
