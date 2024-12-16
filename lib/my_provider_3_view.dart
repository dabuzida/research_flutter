import 'package:flutter/material.dart';
import 'package:research_flutter/my_provider_provider.dart';

class MyProvider3View extends StatefulWidget {
  const MyProvider3View({super.key});

  @override
  State<MyProvider3View> createState() => _MyProvider3ViewState();
}

class _MyProvider3ViewState extends State<MyProvider3View> {
  @override
  Widget build(BuildContext context) {
    print('3 view build');
    return Text(
      MyProviderProvider().text3 ?? 'x3',
    );
  }
}
