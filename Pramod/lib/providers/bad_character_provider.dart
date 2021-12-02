import 'package:flutter/foundation.dart';
import 'package:flutter_purpose/model/bad_model.dart';
import 'package:flutter_purpose/networking/api_response.dart';
import 'package:flutter_purpose/repositories/purpose_repository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

class BadCharacterProvider with ChangeNotifier {
  var _pageSize = 10;
  var sendBirthDate = '', finalBirthDate = '';

  PagingController<int, BadModel> _pagingController =
      PagingController(firstPageKey: 0);

  PagingController<int, BadModel> get pagingController => _pagingController;

  late ApiResponse<List<BadModel>> _badCharacters;

  ApiResponse<List<BadModel>> get badCharacters => _badCharacters;

  BadCharacterProvider() {
    print("Calling");
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future _fetchPage(int pageKey) async {
    late PurposeRepository _purposeRepository = PurposeRepository();
    dynamic badModel =
        await _purposeRepository.fetchBadCharacters(pageKey, _pageSize);
    List<BadModel> barChars =
        List<BadModel>.from(badModel.map((model) => BadModel.fromJson(model)));
    print(barChars);
    final isLastPage = barChars.length < _pageSize;
    if (isLastPage) {
      _pagingController.appendLastPage(barChars);
    } else {
      final nextPageKey = pageKey + 1;
      _pagingController.appendPage(barChars, nextPageKey);
    }
    notifyListeners();
  }


  dynamic birthDateFun(var dateTime) {
    if (!dateTime.contains('Unknown')) {
      DateTime tempDate = new DateFormat("dd-MM-yyyy").parse(dateTime);
      var day = DateFormat.d().format(tempDate);
      var month = DateFormat.MMM().format(tempDate);
      var year = DateFormat.y().format(tempDate);
      //finalBirthDate =
      //print(sendBirthDate);
      return sendBirthDate = day + ' ' + month + ', ' + year;
    } else {
      return sendBirthDate = "Unknown";
    }
  }
}
