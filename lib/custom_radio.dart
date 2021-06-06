import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioItem extends StatelessWidget {
  final bool isSelected;
  final String buttonText;

  RadioItem({
    required this.isSelected,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: isSelected ? -10 : 4,
              lightSource: LightSource.topLeft,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.height * 0.2,
              child: Center(
                child: Text(buttonText,
                    style: GoogleFonts.poppins(
                        color: Colors.black, fontSize: 18.0)),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
