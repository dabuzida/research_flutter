import 'package:flutter/material.dart';
import 'package:research_flutter/my_checkbox.dart';
import 'package:research_flutter/my_flutter_library.dart';
import 'package:research_flutter/my_list_view_builder.dart';
import 'package:research_flutter/my_provider.dart';
import 'package:research_flutter/my_qr_code.dart';
import 'package:research_flutter/start_page.dart';

enum Targets {
  aa1('start-page', StartPage()),
  aaa('checkbox', MyCheckbox()),
  bbb2('qr-code', MyQrCode()),
  bbb23('flutter-library', MyFlutterLibrary()), // 다트 아닌 플러터 지원 라이브러리 테스트
  listViewBuilder('ListView.builder', MyListViewBuilder()),
  provider('provider', MyProvider()),
  // bb44b3('5', MyCheckbox()),
  // bb4b33('6', MyCheckbox()),
  // bb524b3('7', MyCheckbox()),
  // bbb53('8', MyCheckbox()),
  ;

  const Targets(this.title, this.widget);

  final String title;
  final Widget widget;
}
