import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_purpose/model/bad_model.dart';
import 'package:flutter_purpose/providers/bad_character_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayCharacter extends StatelessWidget {
  final BadModel items;

  DisplayCharacter({required this.items});
  BadCharacterProvider _badCharacterProvider = BadCharacterProvider();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF10101A),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 420.0,
                floating: false,
                pinned: true,
                backgroundColor: Colors.black,
                leading: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    items.name ?? '',
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w200),
                  ),
                  background: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Color(0xFF10101A).withOpacity(0.6), BlendMode.darken),
                    child: Image.network(
                      items.img ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                description('Status', items.status ?? ''),
                SizedBox(
                  height: 4.0,
                ),
                description('Nick Name', items.nickname ?? ''),
                SizedBox(
                  height: 4.0,
                ),
                description('Born', _badCharacterProvider.birthDateFun(items.birthday) ?? ''),
                SizedBox(
                  height: 4.0,
                ),
                description('Portrayed', items.portrayed ?? ''),
                SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Occupation : ',
                      style: GoogleFonts.nunito(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (overScroll) {

                            overScroll.disallowGlow();

                            return false;

                          },
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: items.occupation?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top : 2.0),
                                child: Text(
                                  items.occupation?[index],
                                  style: GoogleFonts.nunito(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget description(String title, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$title : ',
          style: GoogleFonts.nunito(
              fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Text(
          description,
          style: GoogleFonts.nunito(
              fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
