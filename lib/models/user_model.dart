import 'package:bematched/utils/extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:geolocator/geolocator.dart';

import '../screens/admin_base_controller.dart';

class UserModel {
  static String TABLE_NAME = "Users";
  String? uid;
  String? email;
  String? name;
  int? flow;
  String? password;
  String? profileImage;
  double? latitude;
  double? longitude;
  Timestamp? dob;
  int? myGender;
  List<dynamic>? interest;
  String? bio;
  List<dynamic>? images;
  int? memberShipType;
  List<dynamic>? myLikes;
  List<dynamic>? otherLikes;
  List<dynamic>? matches;
  List<dynamic>? myDisLikes;
  List<dynamic>? otherDislikes;
  int? likes;
  bool? isDeleted;
  bool? isBlocked;
  Timestamp? updated_time;

  UserModel({this.email, this.flow, this.password, this.profileImage});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    flow = json['flow'];
    uid = json['uid'];
    updated_time = json['updated_time'];
    profileImage = json['profile_image'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    dob = json['dob'];
    myGender = json['my_gender'];
    interest = json['interest'];
    bio = json['bio'];
    images = json['images'];
    memberShipType = json['member_ship_type'] ?? 0;

    myLikes = json['my_likes'] ?? [];
    otherLikes = json['other_likes'] ?? [];
    myDisLikes = json['my_dislikes'] ?? [];
    otherDislikes = json['other_dislikes'] ?? [];
    matches = json['matches'] ?? [];
    likes = json['likes'] ?? 0;
    isDeleted = json['is_deleted'] ?? false;
    isBlocked = json['is_blocked'] ?? false;

    if ((isDeleted ?? false) || (profileImage?.isEmpty ?? true)) {
      profileImage =
          "https://firebasestorage.googleapis.com/v0/b/ever-love.appspot.com/o/574748-200.png?alt=media&token=07c4576a-5568-4e3c-8b4a-e4a1222f6873";
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['flow'] = flow;
    data['uid'] = uid;
    data['profile_image'] = profileImage;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['dob'] = dob;
    data['my_gender'] = myGender;
    data['interest'] = interest ?? [];
    data['bio'] = bio;
    data['images'] = images ?? [];
    data['member_ship_type'] = memberShipType ?? 0;

    data['my_likes'] = myLikes ?? [];
    data['other_likes'] = otherLikes ?? [];
    data['my_dislikes'] = myDisLikes ?? [];
    data['other_dislikes'] = otherDislikes ?? [];
    data['matches'] = matches ?? [];
    data['likes'] = likes ?? 0;
    data['is_deleted'] = isDeleted ?? false;
    data['is_blocked'] = isBlocked ?? false;

    return data;
  }

  List<String> get heartCount {
    Set<String> count = <String>{};
    print("matches$matches");
    otherLikes?.forEach((element) {
      if (!matches!.contains(element)) count.add(element);
    });
    /*otherSuperLikes?.forEach((element) {
      if (!matches!.contains(element)) count.add(element);
    });
    */
    return count.toList();
  }

  Future addNewUserOrUpdate() async {
    await FirebaseFirestore.instance
        .collection(TABLE_NAME)
        .doc(uid!)
        .set(toJson(), SetOptions(merge: true));
  }

  static Future<UserModel?> getUserDetail(String uid) async {
    print(uid);
    if (AdminBaseController.getUser(uid) != null) {
      return AdminBaseController.getUser(uid);
    }
    UserModel? userModel;
    try {
      var snapShot = await FirebaseFirestore.instance
          .collection(TABLE_NAME)
          .doc(uid)
          .get();
      if (!snapShot.exists) return null;
      print(snapShot.data());
      userModel = UserModel.fromJson(snapShot.data() ?? {});
      if (userModel.uid == (FirebaseAuth.instance.currentUser?.uid ?? "")) {
        AdminBaseController.updateUser(userModel);
      } else {
        AdminBaseController.addUser(userModel);
      }
    } on Exception catch (e) {
      throw e.toString();
    }

    return userModel;
  }

  int get age {
    return DateTime.now().difference(dob?.toDate() ?? DateTime.now()).inDays ~/
        365;
  }

  @override
  String toString() {
    return 'UserModel{uid: $uid, email: $email, flow: $flow, password: $password, profileImage: $profileImage, latitude: $latitude, longitude: $longitude, dob: $dob, myGender: $myGender, interest: $interest, bio: $bio, images: $images, memberShipType: $memberShipType}';
  }

  int get distance {
    var position = AdminBaseController.getPosition;
    return ((Geolocator.distanceBetween(latitude ?? 0, longitude ?? 0,
                position.latitude, position.longitude)) *
            0.000621371)
        .toInt();

    return ((Geolocator.distanceBetween(latitude ?? 0, longitude ?? 0,
                    position.latitude, position.longitude) ~/
                1000) *
            0.62)
        .toInt();

    /* print(position);
    print(latitude);
    print(longitude);

    var distance = calculateDistance(
        latitude, longitude, position.latitude, position.longitude);
    print(distance.toInt().toString());
    return distance.toInt().toString();*/
  }

  bool isLiked(String uid) {
    print(myLikes);

    if (myLikes == null) {
      return false;
    }
    print(myLikes!.contains(uid));

    return myLikes!.contains(uid);
  }

  bool isDisLiked(String uid) {
    print(myDisLikes);
    if (myDisLikes == null) {
      return false;
    }
    print(myDisLikes!.contains(uid));
    return myDisLikes!.contains(uid);
  }

  static String getHeight(double height) {
    var feet = (height / 13) + 3;
    var inches = (height % 13);
    return "${feet.toInt()}’’${inches.toInt()}’";
  }

  int checkString(String? value) {
    if (value?.isNotEmpty ?? false) {
      return 1;
    }
    return 0;
  }

  int checkDoubleNumber(double? number) {
    if (number != null && number >= 0) {
      return 1;
    }
    return 0;
  }

  int checkNumber(int? number) {
    if (number != null && number >= 0) {
      return 1;
    }
    return 0;
  }

/*  void updatePosition() {
    final geo = Geoflutterfire();
    GeoFirePoint myLocation =
        geo.point(latitude: latitude!, longitude: longitude!);
    point = LocationPoint()
      ..geoHash = myLocation.hash
      ..geoPoint = myLocation.geoPoint;
  }*/
}

class LocationPoint {
  String? geoHash;
  GeoPoint? geoPoint;

  LocationPoint();

  LocationPoint.fromJson(Map<String, dynamic> json) {
    geoHash = json['geohash'];
    geoPoint = json['geopoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['geohash'] = geoHash;
    data['geopoint'] = geoPoint;
    return data;
  }
}
