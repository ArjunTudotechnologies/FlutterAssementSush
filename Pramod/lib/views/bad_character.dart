import 'package:flutter/material.dart';
import 'package:flutter_purpose/model/bad_model.dart';
import 'package:flutter_purpose/networking/http_client.dart';
import 'package:flutter_purpose/providers/bad_character_provider.dart';
import 'package:flutter_purpose/repositories/purpose_repository.dart';
import 'package:flutter_purpose/views/display_character.dart';
import 'package:flutter_purpose/widgets/bad_character_card.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class BadCharactersList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF10101A),
      body: Consumer<BadCharacterProvider>(
        builder: (context, badCharModel, child) {
          return PagedListView<int, BadModel>(
            pagingController: badCharModel.pagingController,
            builderDelegate: PagedChildBuilderDelegate<BadModel>(
              itemBuilder: (context, item, index) {
                var dateTime = item.birthday ?? '';
                var sendBirthDate = badCharModel.birthDateFun(dateTime);
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayCharacter(
                          items: item,
                        ),
                      ),
                    );
                  },
                  child: BadCharacterCard(
                    image: item.img ?? 'https://via.placeholder.com/150',
                    characterName: item.name ?? '',
                    dateOfBirth: sendBirthDate,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
