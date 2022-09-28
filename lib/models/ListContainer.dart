import "package:flutter/material.dart";
import "/assets/colors/palette.dart";

//MARK: 코드 간결화를 위한 컨테이너 클래스화
class CustomBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 80,
      decoration: BoxDecoration(
          color: Palette.containersColor,
          borderRadius: BorderRadius.circular(5.0),
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
                blurRadius: 0, color: Palette.shadowColor, offset: Offset(0, 5))
          ]),
    );
  }
}
