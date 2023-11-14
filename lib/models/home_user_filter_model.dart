import 'dart:convert';
import '../utils/data_cache.dart';

class HomeFilterModel {
  List<int>? lookingFor;
  List<int>? interestedIn;
  int? distance;
  Age? age;
  bool? usePostCode;

  HomeFilterModel({this.lookingFor, this.distance, this.age});

  HomeFilterModel.fromJson(Map<String, dynamic> json) {
    lookingFor = json['looking_for']?.cast<int>() ?? [];
    interestedIn = json['interested_in']?.cast<int>() ?? [];
    distance = json['distance'];
    usePostCode = json['use_post_code'] ?? false;
    age = json['age'] != null ? Age.fromJson(json['age']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['looking_for'] = lookingFor;
    data['interested_in'] = interestedIn;
    data['distance'] = distance;
    data['use_post_code'] = usePostCode;
    if (age != null) {
      data['age'] = age!.toJson();
    }
    return data;
  }

  void update() {
    var json1 = json.encode(toJson());
    DataCache.data.setString(DataCache.USER_FILTER, json1);
  }

  static HomeFilterModel getUser() {
    String text = DataCache.data.getString(DataCache.USER_FILTER) ?? "";
    if (text.isEmpty) {
      HomeFilterModel.initFilter();
      text = DataCache.data.getString(DataCache.USER_FILTER) ?? "";
    }
    return HomeFilterModel.fromJson(jsonDecode(text) as Map<String, dynamic>);
  }

  static void initFilter() {
    var age = Age()
      ..start = 18
      ..end = 30;
    var filter = HomeFilterModel()
      ..distance = 100
      ..lookingFor = [0, 1, 2, 3, 4]
      ..interestedIn = [0, 1, 2, 3]
      ..age = age;
    filter.update();
  }

  @override
  String toString() {
    return 'UserFilterModel{lookingFor: $lookingFor, distance: $distance, age: $age}';
  }
}

class Age {
  int? start;
  int? end;

  Age({this.start, this.end});

  Age.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }

  @override
  String toString() {
    return 'Age{start: $start, end: $end}';
  }
}
