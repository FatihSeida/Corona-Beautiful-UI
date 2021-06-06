import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CoronaDataCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color? color;

  const CoronaDataCard(
      {required this.icon,
      required this.title,
      required this.value,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          depth: 4,
          lightSource: LightSource.topLeft,
        ),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          height: 100,
          width: 190,
          decoration: BoxDecoration(color: Colors.grey[300]),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Icon(
                  icon,
                  color: color,
                  size: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                    Text(
                      value,
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black54),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
