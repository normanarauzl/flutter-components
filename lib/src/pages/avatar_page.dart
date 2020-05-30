import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only( right: 5.0 ),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://scontent.fmga5-1.fna.fbcdn.net/v/t1.0-9/39441859_10217347814271042_1273241422811627520_n.jpg?_nc_cat=108&_nc_sid=85a577&_nc_ohc=gMFmf_28V5sAX_RDx8Z&_nc_ht=scontent.fmga5-1.fna&oh=f13186577b42a4928c167da9a45a4ec3&oe=5EEE013B'),
              radius: 30.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only( right: 10.0 ),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),

      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://scontent.fmga5-1.fna.fbcdn.net/v/t1.0-9/39441859_10217347814271042_1273241422811627520_n.jpg?_nc_cat=108&_nc_sid=85a577&_nc_ohc=gMFmf_28V5sAX_RDx8Z&_nc_ht=scontent.fmga5-1.fna&oh=f13186577b42a4928c167da9a45a4ec3&oe=5EEE013B'),
          placeholder: AssetImage('assets/original.gif'),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}