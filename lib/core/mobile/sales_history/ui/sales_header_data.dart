import 'package:flutter/material.dart';

import '../../../../constants/app_constants.dart';
import '../../../../utils/ui_utils/spacer_widget.dart';
import '../../../../utils/ui_utils/text_styles/custom_text_style.dart';

// ignore: must_be_immutable
class SalesHeaderAndData extends StatefulWidget {
  String? heading;
  String? content;
  Color? headingColor;
  Color? contentColor;
  CrossAxisAlignment crossAlign;

  SalesHeaderAndData(
      {Key? key,
      this.heading,
      this.content,
      this.crossAlign = CrossAxisAlignment.start,
      this.headingColor =const  Color(0xFF000000),
      this.contentColor =const  Color(0xFF000000)})
      : super(key: key);

  @override
  State<SalesHeaderAndData> createState() => _SalesHeaderAndDataState();
}

class _SalesHeaderAndDataState extends State<SalesHeaderAndData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: widget.crossAlign,
      children: [
        Text(widget.heading!,
            textAlign: TextAlign.end,
            style: getTextStyle(
                fontWeight: FontWeight.w500, color: widget.headingColor)),
        hightSpacer5,
        Text(
          widget.content!,
          style: getTextStyle(
              fontSize: MEDIUM_MINUS_FONT_SIZE, color: widget.contentColor),
        )
      ],
    );
  }
}
