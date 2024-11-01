import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({super.key});

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        height: 300,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Column(
          children: <Widget>[
            _buildUICheckboxWithTitle(
              title: 'car',
              value: isChecked,
              onChanged: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
            ),
            _buildUICheckboxWithTitle3(
              title: 'license',
              value: isChecked3,
              onChanged: () {
                setState(() {
                  isChecked3 = !isChecked3;
                });
              },
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('12345'),
                  onPressed: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUICheckboxWithTitle({
    required String title,
    required bool value,
    required void Function() onChanged,
    bool isShapeRectangle = true,
  }) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: value,
          checkColor: Colors.red, //  체크시, v표시 색
          activeColor: Colors.white, // 체크시, 바탕색
          side: MaterialStateBorderSide.resolveWith(
            (Set<MaterialState> states) {
              if (value) {
                return const BorderSide(color: Colors.red, width: 2);
              }

              return const BorderSide(color: Color(0xFFC9C9C9), width: 2);
            },
          ),
          shape: isShapeRectangle ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)) : const CircleBorder(),
          splashRadius: 0.0, // 버튼에 호버시, 체크박스를 감싸는 물방울 그림자
          onChanged: (bool? value) {
            onChanged();
          },
        ),
        GestureDetector(
          onTap: onChanged,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(title),
          ),
        ),
      ],
    );
  }

  Widget _buildUICheckboxWithTitle3({
    required String title,
    required bool value,
    required void Function() onChanged,
  }) {
    return Row(
      children: <Widget>[
        Checkbox(
          checkColor: Colors.red, //  체크시, 체크아이콘 색
          activeColor: Colors.white, // 체크시,  바탕색
          side: MaterialStateBorderSide.resolveWith(
            (Set<MaterialState> states) => const BorderSide(color: Colors.red, width: 2),
            // (Set<MaterialState> states) {
            //   return const BorderSide(color: Colors.red, width: 2);
            // },
          ),
          splashRadius: 0.0, // 버튼에 호버시, 체크박스를 감싸는 물방울 그림자
          value: value,
          onChanged: (bool? value) {
            onChanged();
          },
        ),
        GestureDetector(
          onTap: onChanged,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(title),
          ),
        ),
      ],
    );
  }
}
