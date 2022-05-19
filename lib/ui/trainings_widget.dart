import 'dart:async';
import 'package:trainer/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:trainer/enums/BodyPartEnum.dart';
import 'package:trainer/model/workout_model.dart';
import 'package:trainer/bloc/preferences_bloc.dart';

import '../bloc/trainings_bloc.dart';
import '../model/workout_model_response.dart';

class TrainingsWidget extends StatefulWidget {
  const TrainingsWidget({
    Key? key,
  }) : super(key: key);

  @override
  _TrainingsWidgetState createState() => _TrainingsWidgetState();
}

class _TrainingsWidgetState extends State<TrainingsWidget> {
  late StreamSubscription<Category> categoryStream;

  @override
  void initState() {
    super.initState();
    categoryStream = PreferencesBloc.instance.stream.listen((_) => workoutBloc.getTrainings());
    workoutBloc.getTrainings();
  }

  @override
  void dispose() {
    super.dispose();
    categoryStream.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<WorkoutModelResponse>(
      stream: workoutBloc.stream,
      builder: (context, AsyncSnapshot<WorkoutModelResponse> snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.requireData;
          if (data.hasError) {
            return Container();
          }
          return _getWorkouts(snapshot.data!);
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("An error occurred"),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _getWorkouts(WorkoutModelResponse data) {
    List<WorkoutModel> workoutModel = data.workoutModel;
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: workoutModel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(workoutModel[index].name.capitalize,style: TextStyle(fontSize: 16),),
                    const SizedBox(
                      height: 8,
                    ),
                    Wrap(
                      runSpacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.start,

                      children: [
                        Text("Equipment:",style: TextStyle(fontSize: 14),),
                          SizedBox(width: 4,),
                        Container(

                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(workoutModel[index].equipment.capitalize,style: TextStyle(fontSize: 12,color: Colors.white),),
                            ),

                        ),
                        SizedBox(width: 16,),
                        Image.network(
                          workoutModel[index].gifUrl,
                          fit: BoxFit.fill,
                          height: 150,
                          width: 150,
                          loadingBuilder:
                              (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),

                    ],
                ),
                const SizedBox(
                  width: 20,
                ),

              ],
            ),
          ));
        });
  }
}
