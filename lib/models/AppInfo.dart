import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("정보"),
      content: SingleChildScrollView(
          child: ListBody(
        children: [
          //MARK: Need to Information datas
          Text("Need to Information datas")
        ],
      )),
    );
  }
}
