import 'package:trainer/utils/parser.dart';

import '../enums/BodyPartEnum.dart';

class CategoryResponse {
  final List<Category> categories;
  final String error;

  CategoryResponse(this.categories, this.error);


   CategoryResponse.fromJson({required dynamic json})
   : categories = Parser.getList(json).map((e) => BodyPartExtension.fromRaw(e.toString())).toList(),
  error = "";

  CategoryResponse.withError(String errorValue)
      : categories = [],
        error = errorValue;

  bool get hasError => error.isNotEmpty;
}
