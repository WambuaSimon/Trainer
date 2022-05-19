import 'package:rxdart/rxdart.dart';
import 'package:trainer/model/workout_model_response.dart';
import 'package:trainer/bloc/preferences_bloc.dart';
import 'package:trainer/repository/trainer_repository.dart';

class TrainingsBloc {
  final TrainerRepository _repository = TrainerRepository();
  final BehaviorSubject<WorkoutModelResponse> _subject = BehaviorSubject<WorkoutModelResponse>();

  getTrainings() async {
    String? category = await PreferencesBloc.instance.retrieveStringValue();
    WorkoutModelResponse response = await _repository.getTrainings(category!);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  Stream<WorkoutModelResponse> get stream => _subject.stream;
}

final workoutBloc = TrainingsBloc();
