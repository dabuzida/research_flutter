import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyQrCode extends StatefulWidget {
  const MyQrCode({super.key});

  @override
  State<MyQrCode> createState() => _MyQrCodeState();
}

class _MyQrCodeState extends State<MyQrCode> {
  bool _switch = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 100),
        CustomPaint(
          size: const Size(200, 200),
          painter: QrPainter(
            data: '123456789',
            version: QrVersions.auto,
          ),
        ),
        SizedBox(height: 100),
        CustomPaint(
          size: const Size(200, 200),
          painter: QrPainter(
            data: 'asdfzxcvfghj',
            version: QrVersions.auto,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _switch = !_switch;
          },
          child: Text('asdfasdf'),
        ),
      ],
    );
  }
}
