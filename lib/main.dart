// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo[800],
          title: Text('Fotos Game'),
        ),
        body: ImagePage(),
      ),
    ),
  );
}

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImgNr = 2;
  int rightImgNr = 1;

  void changeImage() {
    leftImgNr = Random().nextInt(9) + 1;
    rightImgNr = Random().nextInt(9) + 1;
  }

  @override
  Widget build(BuildContext context) {
    //leftImgNr = 2;
    //rightImgNr = 3;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          textAlign: TextAlign.center,
          leftImgNr == rightImgNr
              ? 'congratulations\n you won!'
              : 'Hard Luck! \n Try Again',
          style: TextStyle(
            fontSize: 42.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeImage();
                    });
                  },
                  child: Image.asset('images/image-$leftImgNr.png'),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        changeImage();
                      });
                    },
                    child: Image.asset('images/image-$rightImgNr.png')),
              ),
            ),
          ],
        )
      ],
    );
  }
}
