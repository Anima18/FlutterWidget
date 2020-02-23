import 'package:flutter/material.dart';

//https://www.jianshu.com/p/e60fb282d1f8
class GridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Girdpaper'),
          centerTitle: true,
        ),
        body: _contentWidget());
  }

  Widget _contentWidget() {
    return Container(

      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        padding: const EdgeInsets.all(10.0),
        childAspectRatio: 1.3,
        children: <Widget>[
          GridTile(
            header: GridTileBar(
              backgroundColor: Colors.redAccent,
              title: Text('title'),
              subtitle: Text('subtitle'),
              leading: Icon(Icons.add),
              trailing: Text("trailing"),
            ),
            child: Image.network(
                'https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg',
                scale: 1,
                fit: BoxFit.cover),
            footer: Text('footer'),
          ),
          GridPaper(
            color: Colors.redAccent,
            child: Image.network(
                'https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg',
                scale: 1,
                fit: BoxFit.cover),
          ),
          Image.network(
              'https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg',
              scale: 1,
              fit: BoxFit.cover),
          Image.network(
              'https://cdn2.jianshu.io/assets/default_avatar/2-9636b13945b9ccf345bc98d0d81074eb.jpg',
              scale: 1,
              fit: BoxFit.cover),
        ],
      ),
    );
  }
}
