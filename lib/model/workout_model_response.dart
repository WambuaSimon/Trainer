import 'package:trainer/model/workout_model.dart';

import '../utils/parser.dart';

class WorkoutModelResponse {
  final List<WorkoutModel> workoutModel;
  final String error;

  bool get hasError => error.isNotEmpty;

  WorkoutModelResponse(this.workoutModel, this.error);

  WorkoutModelResponse.fromJson({required dynamic json})
      : workoutModel = Parser.getList(json).map((e) => WorkoutModel.fromJson(json: e)).toList(),
        error = "";

  WorkoutModelResponse.withError(String errorValue)
      : workoutModel = [],
        error = errorValue;
}
