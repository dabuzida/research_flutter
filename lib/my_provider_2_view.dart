import 'package:flutter/material.dart';
import 'package:research_flutter/my_provider_provider.dart';

class MyProvider2View extends StatelessWidget {
  const MyProvider2View({super.key});

  @override
  Widget build(BuildContext context) {
    print('2 view build $key');

    return Text(
      MyProviderProvider().text2 ?? 'x2',
    );
  }
}
