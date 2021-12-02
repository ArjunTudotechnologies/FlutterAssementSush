import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BadCharacterCard extends StatelessWidget {
  final String image;
  final String characterName;
  final dateOfBirth;

  BadCharacterCard({
    required this.image,
    required this.characterName,
    required this.dateOfBirth,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF10101A),
      child: Container(
        height: 140.0,
        width: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                elevation: 2.0,
                color: Color(0xFF21222E),
                child: Container(
                  height: 100.0,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 110.0, top: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          characterName,
                          style: GoogleFonts.nunito(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          dateOfBirth,
                          style: GoogleFonts.nunito(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  height: 110.0,
                  width: 100.0,
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network(
                      image,
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
