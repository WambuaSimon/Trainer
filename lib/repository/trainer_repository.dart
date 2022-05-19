import 'package:dio/dio.dart';
import 'package:trainer/model/category_response.dart';
import 'package:trainer/model/workout_model_response.dart';

class TrainerRepository {
  var baseUrl = "https://exercisedb.p.rapidapi.com/exercises";
  final Dio _dio = Dio();
  final headers = {
    "x-rapidapi-host": "exercisedb.p.rapidapi.com",
    "x-rapidapi-key": "9b3ace10f8msh49be3df8787f12bp17b6dcjsnf8cc541bba40"
  };

  Future getCategories() async {
    try {
      Response response = await _dio.get("https://exercisedb.p.rapidapi.com/exercises/bodyPartList",
          options: Options(headers: headers));
      return CategoryResponse.fromJson(json: response.data);
    } catch (error) {
      return WorkoutModelResponse.withError("$error");
    }
  }

  Future<WorkoutModelResponse> getTrainings(String bodyPart) async {
    try {
      Response response = await _dio.get(
          "https://exercisedb.p.rapidapi.com/exercises/bodyPart/$bodyPart",
          options: Options(headers: headers));
      if (response.statusCode == 200 && response.statusCode != 403) {
        return WorkoutModelResponse.fromJson(json: response.data);
      }
      return WorkoutModelResponse.withError("${response.statusMessage}");
    } catch (error) {
      return WorkoutModelResponse.withError("$error");
    }
  }
}
