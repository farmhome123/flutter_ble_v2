import 'package:flutter/material.dart';
import 'dart:convert' show utf8;

import 'package:flutter_blue/flutter_blue.dart';

class page2_screen extends StatefulWidget {
  final List<int>? valueTx;
  final BluetoothCharacteristic? characteristic;
  const page2_screen({
    Key? key,
    required this.valueTx,
    required this.characteristic,
  }) : super(key: key);

  @override
  _page2_screenState createState() => _page2_screenState();
}

class _page2_screenState extends State<page2_screen> {
  String _dataParser(List<int> dataFromDevice) {
    return utf8.decode(dataFromDevice);
  }

  final _writeController = TextEditingController();
  FlutterBlue flutterBlue = FlutterBlue.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2 ${_dataParser(widget.valueTx!)}'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('DATA :${_dataParser(widget.valueTx!)}')),
              TextField(
                controller: _writeController,
              ),
              FlatButton(
                color: Colors.green,
                onPressed: () async {
                  if (widget.characteristic! == null) {
                    print('characteristic NULl !!!!!');
                    return;
                  } else {
                    // Future.delayed(
                    //   const Duration(seconds: 2),
                    //   () => {},
                    // );
                    print(_writeController.value.text);
                    // print(widget.characteristic!.uuid);
                    widget.characteristic!.write(
                        utf8.encode(_writeController.value.text),
                        withoutResponse: mounted);
                  }
                },
                child: Text('Send DATA TO ESP32'),
              )
            ],
          ),
        ),
      )),
    );
  }
}
