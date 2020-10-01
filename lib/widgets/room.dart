import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/config/palette.dart';
import 'package:flutter_facebook_ui/models/user_model.dart';
import 'package:flutter_facebook_ui/widgets/profile_avatar.dart';

class Room extends StatelessWidget {
  final List<User> listUser;

  Room(this.listUser);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + listUser.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return OutlineButton.icon(
              borderSide: BorderSide(
                  width: 4.0,
                  color: Colors.blueAccent[100]) ,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {},
              textColor: Palette.facebookBlue,
              icon: const Icon(Icons.videocam),
              label: Text("Create\nRoom"),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: ProfileAvatar(imageUrl: listUser[index -1].imageUrl, isActive: true));
        },
      ),
    );
  }
}
