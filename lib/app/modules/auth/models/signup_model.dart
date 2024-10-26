// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  String? message;
  User? user;

  SignupModel({
    this.message,
    this.user,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
    message: json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user?.toJson(),
  };
}

class User {
  String? fullName;
  String? username;
  String? avatar;
  String? email;
  bool? isEmailVerified;
  bool? isAdmin;
  bool? isSuperAdmin;
  bool? isDeleted;
  String? language;
  String? defaultWorkspace;
  List<String>? workspaces;
  List<dynamic>? campaigns;
  int? maxWorkspaces;
  int? storageSizeInBytes;
  Subscription? subscription;
  String? id;
  int? v;

  User({
    this.fullName,
    this.username,
    this.avatar,
    this.email,
    this.isEmailVerified,
    this.isAdmin,
    this.isSuperAdmin,
    this.isDeleted,
    this.language,
    this.defaultWorkspace,
    this.workspaces,
    this.campaigns,
    this.maxWorkspaces,
    this.storageSizeInBytes,
    this.subscription,
    this.id,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    fullName: json["fullName"],
    username: json["username"],
    avatar: json["avatar"],
    email: json["email"],
    isEmailVerified: json["isEmailVerified"],
    isAdmin: json["isAdmin"],
    isSuperAdmin: json["isSuperAdmin"],
    isDeleted: json["isDeleted"],
    language: json["language"],
    defaultWorkspace: json["defaultWorkspace"],
    workspaces: json["workspaces"] == null ? [] : List<String>.from(json["workspaces"]!.map((x) => x)),
    campaigns: json["campaigns"] == null ? [] : List<dynamic>.from(json["campaigns"]!.map((x) => x)),
    maxWorkspaces: json["maxWorkspaces"],
    storageSizeInBytes: json["storageSizeInBytes"],
    subscription: json["subscription"] == null ? null : Subscription.fromJson(json["subscription"]),
    id: json["_id"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "username": username,
    "avatar": avatar,
    "email": email,
    "isEmailVerified": isEmailVerified,
    "isAdmin": isAdmin,
    "isSuperAdmin": isSuperAdmin,
    "isDeleted": isDeleted,
    "language": language,
    "defaultWorkspace": defaultWorkspace,
    "workspaces": workspaces == null ? [] : List<dynamic>.from(workspaces!.map((x) => x)),
    "campaigns": campaigns == null ? [] : List<dynamic>.from(campaigns!.map((x) => x)),
    "maxWorkspaces": maxWorkspaces,
    "storageSizeInBytes": storageSizeInBytes,
    "subscription": subscription?.toJson(),
    "_id": id,
    "__v": v,
  };
}

class Subscription {
  String? status;
  bool? isEligibleForProratedDiscount;

  Subscription({
    this.status,
    this.isEligibleForProratedDiscount,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
    status: json["status"],
    isEligibleForProratedDiscount: json["isEligibleForProratedDiscount"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "isEligibleForProratedDiscount": isEligibleForProratedDiscount,
  };
}
