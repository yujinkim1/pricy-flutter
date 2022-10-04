import "package:flutter/material.dart";
import "/assets/colors/palette.dart";

//MARK: 코드 간결화를 위한 컨테이너 클래스화
class CustomBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 60,
      decoration: BoxDecoration(
          color: Palette.containerColor,
          borderRadius: BorderRadius.circular(5.0),
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
                blurRadius: 0, color: Palette.shadowColor, offset: Offset(0, 5))
          ]),
    );
  }
}

//MARK: ItemContainer
class ItemBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          color: Palette.containerColor,
          borderRadius: BorderRadius.circular(5.0),
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
                blurRadius: 0, color: Palette.shadowColor, offset: Offset(0, 5))
          ]),
    );
  }
}

//MARK: ChartContainer
class ChartBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          color: Palette.containerColor,
          borderRadius: BorderRadius.circular(5.0),
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
                blurRadius: 0, color: Palette.shadowColor, offset: Offset(0, 5))
          ]),
      child: Column(children: [
        Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
        Container()
      ]),
    );
  }
}
