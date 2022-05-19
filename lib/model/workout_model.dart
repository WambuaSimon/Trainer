class WorkoutModel {
  final String bodyPart;
  final String equipment;
  final String gifUrl;
  final String name;

  WorkoutModel(this.bodyPart, this.equipment, this.gifUrl, this.name);

  WorkoutModel.fromJson({required Map<String, dynamic> json})
      : bodyPart = json["bodyPart"],
        equipment = json["equipment"],
        gifUrl = json["gifUrl"],
        name = json["name"];
}
