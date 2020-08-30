import 'package:flutter/material.dart';
import 'package:paytm_demo/Size_Config/Size_Config.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double FontSize;
  final TextAlign align;
  final int maxLine;
  final FontWeight FontWeights;

  CustomText(
      {@required this.text,
      this.color,
      this.align,
      this.maxLine,
      this.FontSize,
      this.FontWeights});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: align,
      overflow: TextOverflow.visible,
      style:
          TextStyle(fontSize: FontSize, color: color, fontWeight: FontWeights),
      maxLines: maxLine,
    );
  }
}
