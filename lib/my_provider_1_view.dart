import 'package:flutter/material.dart';
import 'package:research_flutter/my_provider_provider.dart';

class MyProvider1View extends StatefulWidget {
  const MyProvider1View({super.key});

  @override
  State<MyProvider1View> createState() => _MyProvider1ViewState();
}

class _MyProvider1ViewState extends State<MyProvider1View> {
  @override
  Widget build(BuildContext context) {
    print('1 view build ${widget.key}');
    return Text(
      MyProviderProvider().text1 ?? 'x1',
    );
  }
}
