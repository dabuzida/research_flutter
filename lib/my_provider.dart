import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:research_flutter/my_provider_provider.dart';

import 'my_provider_1_view.dart';
import 'my_provider_2_view.dart';
import 'my_provider_3_view.dart';

class MyProvider extends StatefulWidget {
  const MyProvider({super.key});

  @override
  State<MyProvider> createState() => _MyProviderState();
}

class _MyProviderState extends State<MyProvider> {
  ValueKey<String?> _valueKey = const ValueKey<String?>(null);
  final ValueKey<String> _valueKey2 = ValueKey<String>('asdf');
  final UniqueKey _valueKey22 = UniqueKey();

  @override
  void initState() {
    super.initState();
    _valueKey = ValueKey<String?>(MyProviderProvider().text1);
    // _valueKey2 = ValueKey<String?>(MyProviderProvider().text2);
  }

  @override
  Widget build(BuildContext context) {
    print('>> build');
    return Center(
      child: Container(
        width: 500,
        height: 800,
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  ListenableBuilder(
                    listenable: MyProviderProvider(),
                    builder: (BuildContext context, Widget? child) {
                      print('1');

                      return MyProvider1View(
                        // key: ValueKey<String>('MyProviderProvider().text1'),
                        // key: ValueKey<String?>(MyProviderProvider().text1),
                        key: _valueKey,
                      );
                    },
                  ),

                  MyProvider2View(
                    // key: ValueKey<String?>(MyProviderProvider().text2),
                    key: UniqueKey(),
                    // key: _valueKey2.value == null ? null : _valueKey2,
                  ),

                  // ListenableBuilder(
                  //   listenable: MyProviderProvider(),
                  //   builder: (BuildContext context, Widget? child) {
                  //     print('2');

                  //     return MyProvider2View(
                  //       // key: ValueKey<String?>(MyProviderProvider().text2),
                  //       key: ValueKey<String>('asffsd'),
                  //       // key: _valueKey2.value == null ? null : _valueKey2,
                  //     );
                  //   },
                  // ),
                  // ListenableBuilder(
                  //   listenable: MyProviderProvider(),
                  //   builder: (BuildContext context, Widget? child) {
                  //     print('3');
                  //     return MyProvider3View(
                  //       key: ValueKey<String?>(MyProviderProvider().text3),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                ElevatedButton(
                  child: Text('change 1'),
                  onPressed: () {
                    _valueKey = ValueKey<String?>(MyProviderProvider().text1);
                    MyProviderProvider().change1();
                  },
                ),
                ElevatedButton(
                  child: Text('change 1 notify x'),
                  onPressed: () {
                    MyProviderProvider().change1(notify: false);
                  },
                ),
                ElevatedButton(
                  child: Text('change 2'),
                  onPressed: () {
                    // _valueKey2 = ValueKey<String?>(MyProviderProvider().text2);
                    // MyProviderProvider().change2();
                    setState(() {});
                  },
                ),
                ElevatedButton(
                  child: Text('change 3'),
                  onPressed: () {
                    MyProviderProvider().change3();
                  },
                ),
                ElevatedButton(
                  child: Text('setState'),
                  onPressed: () {
                    setState(() {});
                  },
                ),
                ElevatedButton(
                  child: Text('inspect'),
                  onPressed: () {
                    inspect(MyProviderProvider());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
