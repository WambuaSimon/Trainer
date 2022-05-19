import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainer/utils/constants.dart' as constants;
import 'package:rxdart/rxdart.dart';

import '../enums/BodyPartEnum.dart' as body_category;

class PreferencesBloc {
  static PreferencesBloc instance = PreferencesBloc();
  final BehaviorSubject<body_category.Category> _subject =
      BehaviorSubject<body_category.Category>();

  Stream<body_category.Category> get stream => _subject.stream;

  saveBodyPartValue(String key, body_category.Category value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value.name.toLowerCase());
    _subject.add(value);
  }

  Future<String?> retrieveStringValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? selectedBodyPart = prefs.getString(constants.bodyPartPrefKey);
    return selectedBodyPart ?? "chest";
  }
}
