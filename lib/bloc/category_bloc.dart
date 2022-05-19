import 'package:rxdart/rxdart.dart';
import '../model/category_response.dart';
import '../repository/trainer_repository.dart';

class CategoryBloc {
 static CategoryBloc instance = CategoryBloc();
  final TrainerRepository _repository = TrainerRepository();
  final BehaviorSubject<CategoryResponse> _subject = BehaviorSubject<CategoryResponse>();

  Stream<CategoryResponse> get stream => _subject.stream;

  void getCategories() async {
    CategoryResponse response = await _repository.getCategories();
    _subject.sink.add(response);
  }


  dispose() {
    _subject.close();
  }
}
final categoryBloc = CategoryBloc();
