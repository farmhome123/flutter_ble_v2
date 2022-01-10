import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:convert' show utf8;

class page3_screen extends StatefulWidget {
  final List<int> valueTx;
  final BluetoothCharacteristic? characteristic;
  const page3_screen({
    Key? key,
    required this.valueTx,
    required this.characteristic,
  }) : super(key: key);

  @override
  _page3_screenState createState() => _page3_screenState();
}

class _page3_screenState extends State<page3_screen> {
  final _writeController = TextEditingController();
  FlutterBlue flutterBlue = FlutterBlue.instance;

  String _dataParser(List<int> dataFromDevice) {
    return utf8.decode(dataFromDevice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page3 ${_dataParser(widget.valueTx)}'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('DATA :${_dataParser(widget.valueTx)}')),
              TextField(
                controller: _writeController,
              ),
              FlatButton(
                color: Colors.green,
                onPressed: () async {
                  print(
                      'send DATA to ESP32! ${utf8.encode(_writeController.value.text)}');
                  // widget.characteristic!
                  //     .write(utf8.encode(_writeController.value.text));
                  //  await  widget.characteristic!.write([0x12, 0x34]);
                  if (widget.characteristic! == null) {
                    print('characteristic NULl !!!!!');
                    return;
                  } else {
                    print(widget.characteristic!.uuid);
                    widget.characteristic!.write(
                      utf8.encode(_writeController.value.text),
                    );
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
