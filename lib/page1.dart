import 'package:flutter/material.dart';

class page1_screen extends StatefulWidget {
  final List<int> valueTx;
  const page1_screen({Key? key,required this.valueTx}) : super(key: key);

  @override
  _page1_screenState createState() => _page1_screenState();
}

class _page1_screenState extends State<page1_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        child: Text('valueNotify '),
      )),
    );
  }
}
