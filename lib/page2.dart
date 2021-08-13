import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final String title;
  final String photoName;

  Page2(this.title, this.photoName)
      : assert(title != null, 'title must has data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop('From Page2');
          },
        ),
      ),
      body: Center(
        child: Image.asset(photoName),
      ),
    );
  }
}
