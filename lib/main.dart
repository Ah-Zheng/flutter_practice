import 'package:flutter/material.dart';
import 'package:photo_show/page2.dart';

void main() {
  return runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> imageArray = [
      // 'https://cdn.pixabay.com/photo/2015/03/26/09/47/sky-690293_1280.jpg',
      // 'https://cdn.pixabay.com/photo/2015/09/09/16/05/forest-931706_1280.jpg',
      // 'https://cdn.pixabay.com/photo/2015/03/17/14/05/sparkler-677774_1280.jpg',
      'assets/images/sky-690293_1280.jpg',
      'assets/images/forest-931706_1280.jpg',
      'assets/images/sparkler-677774_1280.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Photo Show',
          style: TextStyle(),
        ),
        backgroundColor: Colors.blue.shade600,
      ),
      body: Column(
        children: List.generate(imageArray.length, (index) {
          return GestureDetector(
            child: buildImageView(imageArray[index]),
            onTap: () {
              NavigatorState nav = Navigator.of(context);
              nav
                  .push(
                    MaterialPageRoute(
                      builder: (context) => Page2('MyPage2', imageArray[index]),
                    ),
                  )
                  .then((value) => print(value));
            },
          );
        }),
      ),
    );
  }

  Widget buildImageView(String url, {String title = 'Container Demo'}) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              // image: NetworkImage(url),
              image: AssetImage(url),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              border: Border.all(
                width: 8,
                color: Colors.white30,
              ),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white54,
                fontFamily: 'Monoton',
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
