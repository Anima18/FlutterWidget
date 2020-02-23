import 'package:flutter/material.dart';

class ListViewDemoWidget extends StatefulWidget {
  @override
  State createState() {
    return ListViewState();
  }
}

class ListViewState extends State {

  List<User> _userList = List();
  ListViewState() {
    for(int i = 0; i < 100; i++) {
      _userList.add(User("user$i", "hello world, hello flutter", "https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg"));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("ListView"),
      ),
      body: ListView.builder(
        itemCount: _userList.length,
        itemBuilder: (context, position) {
          return ListViewItem(_userList[position], (user) => {

          });
        },
      ),
    );
  }

}

typedef OnItemClickListener = void Function(User user);

class ListViewItem extends StatelessWidget {

  User _user;
  OnItemClickListener _clickListener;

  ListViewItem(this._user, this._clickListener);

  @override
  Widget build(BuildContext context) {
    var widget =  Container(
      height: 100,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FadeInImage.assetNetwork(
            placeholder: "icons/ic_launcher.png",
            image: _user.url,
            width: 72,
            height: 72,
            fit: BoxFit.fitWidth,
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_user.name),
                Text(_user.info)
              ],
            ),
          )
        ],
      ),
    );

    //InkWell点击的时候有水波纹效果
    return InkWell(
        onTap: () => _clickListener(_user),
        child: widget
    );
  }
}

class User {
  String name;
  String info;
  String url;

  User(this.name, this.info, this.url);

}

