enum Category {
  back,
  cardio,
  chest,
  lowerArms,
  lowerLegs,
  neck,
  shoulders,
  upperArms,
  upperLegs,
  waist,
  unknown
}

extension BodyPartExtension on Category {
  static Category fromRaw(String raw) {
    final _raw = raw.toLowerCase();
    switch (_raw) {
      case "back":
        return Category.back;

      case "cardio":
        return Category.cardio;

      case "chest":
        return Category.chest;

      case "lower arms":
        return Category.lowerArms;

      case "lower legs":
        return Category.lowerLegs;

      case "neck":
        return Category.neck;

      case "shoulders":
        return Category.shoulders;

      case "upper arms":
        return Category.upperArms;

      case "upper legs":
        return Category.upperLegs;

      case "waist":
        return Category.waist;
    }
    return Category.unknown;
  }

  String  get name {
    switch(this) {

      case Category.back: return "Back";
      case Category.cardio: return "Cardio";


      case Category.chest:return "Chest";


      case Category.lowerArms: return "Lower Arms";


      case Category.lowerLegs:return "Lower legs";


      case Category.neck:return "Neck";

      case Category.shoulders: return "Shoulders";

      case Category.upperArms: return "Upper arms";

      case Category.upperLegs: return "Upper legs";

      case Category.waist: return "Waist";


      case Category.unknown:
      return "Unknown";

    }

  }

  String get displayableAsset{
    switch(this){
      case Category.back:
        return "assets/back.png";

      case Category.cardio:
        return "assets/cardio.png";

      case Category.chest:
        return "assets/chest.png";

      case Category.lowerArms:
        return "assets/lower_arm.png";

      case Category.lowerLegs:
        return "assets/lower_leg.png";

      case Category.neck:
        return "assets/neck.png";

      case Category.shoulders:
        return "assets/shoulder.png";

      case Category.upperArms:
        return "assets/upper_arm.png";

      case Category.upperLegs:
        return "assets/upper_leg.png";

      case Category.waist:
        return "assets/waist.png";
      case Category.unknown:
        return "";
    }
  }

}
