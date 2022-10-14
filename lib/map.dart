import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _FeedState();
}

class _FeedState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            title: Center(
              child: Text('Map'),
              ),
              
              ),
               preferredSize: Size.fromHeight(25),
        ),
            body: Container(
             // margin: EdgeInsets.all(10),
              child:  InteractiveViewer(
                child: Image.asset('lib/assets/map.png'),
                panEnabled: true,),
              alignment: Alignment.center,
          //  PhotoView(imageProvider: AssetImage("assets/cat.jpg"),)
              ),
            ),
        );
  }
}