import 'package:flutter/material.dart';
import 'package:research_flutter/my_checkbox.dart';
import 'package:research_flutter/my_qr_code.dart';
import 'package:research_flutter/start_page.dart';

enum Targets {
  aa1('start-page', StartPage()),
  aaa('checkbox', MyCheckbox()),
  bbb2('qr-code', MyQrCode()),
  // bbb23('2', MyCheckbox()),
  // bb2b3('3', MyCheckbox()),
  // bb4b3('4', MyCheckbox()),
  // bb44b3('5', MyCheckbox()),
  // bb4b33('6', MyCheckbox()),
  // bb524b3('7', MyCheckbox()),
  // bbb53('8', MyCheckbox()),
  ;

  const Targets(this.title, this.widget);

  final String title;
  final Widget widget;
}
