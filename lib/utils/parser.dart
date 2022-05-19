class Parser {
  static int getInt(Map<String, dynamic>? obj, String key) {
    if (obj == null) return 0;
    if (!obj.containsKey(key)) {
      return 0;
    }
    final res = obj[key];
    if (res is int) {
      return res;
    }
    if (res is double) {
      return res.toInt();
    }
    if (res is String) {
      final parsedInt = int.tryParse(res);
      final parsedDouble = double.tryParse(res);
      return parsedInt ?? parsedDouble?.toInt() ?? 0;

    }
    return 0;
  }

  static int? getIntNullable(Map<String, dynamic>? obj, String key) {
    if (obj == null) return null;
    if (!obj.containsKey(key)) {
      return null;
    }
    final res = obj[key];
    if (res is int) {
      return res;
    }
    if (res is double) {
      return res.toInt();
    }
    if (res is String) {
      final parsedInt = int.tryParse(res);
      final parsedDouble = double.tryParse(res);
      return parsedInt ?? parsedDouble?.toInt();
    }
    return null;
  }

  static double? getDoubleNullable(Map<String, dynamic>? obj, String key) {
    if (obj == null) return null;

    if (!obj.containsKey(key)) {
      return null;
    }
    final res = obj[key];
    if (res is double) {
      return res;
    }
    if (res is int) {
      return res.toDouble();
    }
    if (res is String) {
      return double.tryParse(res);
    }
    return null;
  }

  static double getDouble(Map<String, dynamic>? obj, String key) {
    if (obj == null) return 0.0;

    if (!obj.containsKey(key)) {
      return 0.0;
    }
    final res = obj[key];
    if (res is double) {
      return res;
    }
    if (res is int) {
      return res.toDouble();
    }
    if (res is String) {
      return double.tryParse(res) ?? 0.0;
    }
    return 0.0;
  }

  static String getString(Map<String, dynamic>? obj, String key) {
    if (obj == null) return "";
    if (!obj.containsKey(key)) {
      return "";
    }
    final res = obj[key];
    if (res is String) {
      return res;
    }
    if (res is num) {
      return res.toString();
    }
    return "";
  }

  static String? getStringNullable(Map<String, dynamic>? obj, String key) {
    if (obj == null) return null;
    if (!obj.containsKey(key)) {
      return null;
    }
    final res = obj[key];
    if (res is String) {
      return res;
    }
    if (res is num) {
      return res.toString();
    }
    return null;
  }

  static String getStringWithKeys(Map<String, dynamic>? obj,List<String> keys)
  {
    for(var key in keys)
    {
      var d = getString(obj,key);
      if (d != "") {
        return d;
      }
    }
    return "";
  }

  static String? getStringWithKeysNullable(Map<String, dynamic>? obj,List<String> keys)
  {
    for(var key in keys)
    {
      var d = getStringNullable(obj,key);
      if (d != null) {
        return d;
      }
    }
    return null;
  }

  static List getListForKey(dynamic obj, String key) {
    if (obj == null) return [];
    final json = getJson(obj);
    final list = json[key];
    if (list is List) {
      return list;
    }
    return [];
  }

  static List getList(dynamic obj) {
    if (obj == null) return [];
    if (obj is List) {
      return obj;
    }
    return [];
  }

  static Map<String, dynamic> getJsonForKey(dynamic obj, String key) {
    if(obj is Map<String, dynamic>) {
      return getJson(obj[key]);
    }
    return <String, dynamic>{};
  }

  static Map<String, dynamic> getJson(dynamic obj) {
    if (obj == null) return <String, dynamic>{};
    if(obj is Map<String, dynamic>) {
      return obj;
    }
    return <String, dynamic>{};
  }

  static DateTime? getTime(Map<String, dynamic>? obj, String key) {
    if (obj == null) return null;
    if (!obj.containsKey(key)) {
      return null;
    }
    final res = obj[key];
    if (res is num) {
      return DateTime.fromMillisecondsSinceEpoch(res.toInt() * 1000);
    }
    if (res is String) {

      //Handle parsing of format 02.02.2022
      RegExp exp = RegExp(r'^\d{2}\.\d{2}\.\d{4}$');
      if(exp.hasMatch(res)) {
        final List<String> parts = res.split(".");
        return DateTime(int.parse(parts.last),int.parse(parts[1]),int.parse(parts.first));
      }
      //Handle parsing of format 02-02-2022
      exp = RegExp(r'^\d{2}\-\d{2}\-\d{4}$');
      if(exp.hasMatch(res)) {
        final List<String> parts = res.split("-");
        return DateTime(int.parse(parts.last),int.parse(parts[1]),int.parse(parts.first));
      }
      //Handle parsing of format 02/02/2022
      exp = RegExp(r'^\d{2}\/\d{2}\/\d{4}$');
      if(exp.hasMatch(res)) {
        final List<String> parts = res.split("/");
        return DateTime(int.parse(parts.last),int.parse(parts[1]),int.parse(parts.first));
      }
      //Handle parsing of format 2022-02-02+01:00
      exp = RegExp(r'^\d{4}\-\d{2}\-\d{2}\+\d{2}:\d{2}$');
      if(exp.hasMatch(res)) {
        final List<String> parts = res.split("-");
        return DateTime(int.parse(parts.first),int.parse(parts[1]),int.parse(parts.last.substring(0,2)));
      }

      return DateTime.tryParse(res);
    }
    return null;
  }

  static DateTime? getTimeWithKeys(Map<String, dynamic>? obj,List<String> keys) {
    for(var key in keys)
    {
      var d = getTime(obj,key);
      if (d != null) {
        return d;
      }
    }
    return null;
  }

  static bool? getBoolNullable(Map<String, dynamic>? obj, String key) {
    if (obj == null) return null;
    if (!obj.containsKey(key)) {
      return null;
    }
    final res = obj[key];
    if (res is bool) {
      return res;
    }
    if(res is String) {
      if(res.toLowerCase() == "true") return true;
      if(res.toLowerCase() == "false") return false;
    }
    return false;
  }

  static bool getBool(Map<String, dynamic>? obj, String key) {
    if (obj == null) return false;
    if (!obj.containsKey(key)) {
      return false;
    }
    final res = obj[key];
    if (res is bool) {
      return res;
    }
    if(res is String) {
      if(res.toLowerCase() == "true") return true;
      if(res.toLowerCase() == "false") return false;
    }
    return false;
  }
}