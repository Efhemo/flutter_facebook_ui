import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/config/palette.dart';
import 'package:flutter_facebook_ui/models/post_model.dart';
import 'package:flutter_facebook_ui/widgets/profile_avatar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  PostContainer({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _PostHeader(post: post),
                Text(post.caption),
                post.imageUrl == null
                    ? SizedBox(height: 6.0)
                    : SizedBox.shrink()
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              : SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _PostStat(post: post),
          ),
        ],
      ),
    );
  }
}

class _PostStat extends StatelessWidget {
  final Post post;

  _PostStat({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Palette.facebookBlue,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.thumb_up, color: Colors.white, size: 10.0),
              ),
              SizedBox(width: 4.0),
              Text(post.comments.toString(),
                  style: TextStyle(color: Colors.grey[600])),
              SizedBox(width: 4.0),
              Expanded(
                  child: Text("${post.comments} Comments",
                      style: TextStyle(color: Colors.grey[600]),
                      textAlign: TextAlign.end)),
              SizedBox(width: 9.0),
              Text("${post.shares} Shares",
                  style: TextStyle(color: Colors.grey[600]))
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _PostButton(icon: MdiIcons.thumbUpOutline, name: "Like", onPressed: () {}),
              _PostButton(icon: MdiIcons.commentOutline, name: "Comment", onPressed: () {}),
              _PostButton(icon: MdiIcons.shareOutline, name: "Share", onPressed: () {})
            ],
          )
        ],
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  final IconData icon;
  final String name;
  final Function onPressed;

  _PostButton(
      {@required this.icon, @required this.name, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FlatButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.grey[600]),
      label: Text(name, style: TextStyle(color: Colors.grey[600])),
    ));
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  _PostHeader({@required this.post});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
      leading: ProfileAvatar(imageUrl: post.user.imageUrl),
      title:
          Text(post.user.name, style: TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Row(
        children: <Widget>[
          Text("${post.timeAgo} * "),
          Icon(Icons.public, size: 12.0)
        ],
      ),
      trailing: IconButton(
          icon: Icon(Icons.more_horiz, color: Colors.black), onPressed: () {}),
    );
  }
}
