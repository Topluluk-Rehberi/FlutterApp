import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/community.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Community communities;

  DetailPage({Key key, this.communities}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  
  Map<String, bool> objects = {
    "twitter": true,
    "github": true,
    "website": true,
    "facebook": true
  };

  void checkVisibilityTwitter() {
    setState(() {
      if (widget.communities.links.twitter == null) {
        objects["twitter"] = false;
      }
    });
  }

  void checkVisibilityGithub() {
    setState(() {
      if (widget.communities.links.github == null) {
        objects["github"] = false;
      }
    });
  }

  void checkVisibilityWebsite() {
    setState(() {
      if (widget.communities.links.website == null) {
        objects["website"] = false;
      }
    });
  }

  void checkVisibilityFacebook() {
    setState(() {
      if (widget.communities.links.twitter == null) {
        objects["facebook"] = false;
      }
    });
  }

  void checkVisibilityAll() {
    checkVisibilityTwitter();
    checkVisibilityGithub();
    checkVisibilityWebsite();
    checkVisibilityFacebook();
  }

  @override
  void initState() {
    checkVisibilityAll();
    print(objects["twitter"]);
    super.initState();
  }

  void visibleAffect() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Icon(
          Icons.people,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          widget.communities.name,
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("event-cover.jpg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              widget.communities.description,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: objects["twitter"],
                  child: IconButton(
                      icon: Icon(EvaIcons.twitter),
                      onPressed: () {
                        launch(widget.communities.links.twitter);
                      }),
                ),
                Visibility(
                  visible: objects["github"],
                  child: IconButton(
                      icon: Icon(EvaIcons.github),
                      onPressed: () {
                        launch(widget.communities.links.github);
                      }),
                ),
                Visibility(
                  visible: objects["website"],
                  child: IconButton(
                      icon: Icon(Icons.alternate_email),
                      onPressed: () {
                        launch(widget.communities.links.website);
                      }),
                ),
                Visibility(
                  visible: objects["facebook"],
                  child: IconButton(
                      icon: Icon(EvaIcons.facebook),
                      onPressed: () {
                        launch(widget.communities.links.facebook);
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[topContent, bottomContent],
        ),
      ),
    );
  }
}
