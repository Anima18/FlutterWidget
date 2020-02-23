import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Image Widget"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Text(
                "AssetImage",
                style: TextStyle(fontSize: 20),
              ),
              CircleAvatar(
                backgroundImage: AssetImage("images/image1.jpg"),
                backgroundColor: Colors.white,
              ),
              Image(
                image: AssetImage("icons/ic_launcher.png"),
              ),

              //========================================
              Text(
                "DecorationImage",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                child: Center(
                  child: Text(
                    "hello world",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/image1.jpg"),
                        fit: BoxFit.cover)),
              ),

              //========================================
              Text(
                "ExactAssetImage",
                style: TextStyle(fontSize: 20),
              ),
              Image(
                image: ExactAssetImage("images/image1.jpg", scale: 10),
              ),
              SizedBox(height: 16),
              Image(
                image: ExactAssetImage("images/image1.jpg", scale: 1),
              ),

              //========================================
              Text(
                "FadeInImage",
                style: TextStyle(fontSize: 20),
              ),
              ClipOval(
                child: FadeInImage.assetNetwork(
                    placeholder: "icons/ic_launcher.png",
                    image: "https://img.36krcdn.com/20200217/v2_d67b0c9b7b814fc0abba62f88c054bd4_img_png",
                width: 160,
                    height: 160,
                    fit: BoxFit.fitWidth,),

              ),

            ],
          ),
        ),
      ),
    );
  }
}
