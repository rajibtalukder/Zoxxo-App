// To parse this JSON data, do
//
//     final signinModel = signinModelFromJson(jsonString);

import 'dart:convert';

SigninModel signinModelFromJson(String str) => SigninModel.fromJson(json.decode(str));

String signinModelToJson(SigninModel data) => json.encode(data.toJson());

class SigninModel {
  Subscription? subscription;
  String? id;
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
  List<Workspace>? workspaces;
  List<dynamic>? campaigns;
  int? maxWorkspaces;
  int? storageSizeInBytes;
  int? v;

  SigninModel({
    this.subscription,
    this.id,
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
    this.v,
  });

  factory SigninModel.fromJson(Map<String, dynamic> json) => SigninModel(
    subscription: json["subscription"] == null ? null : Subscription.fromJson(json["subscription"]),
    id: json["_id"],
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
    workspaces: json["workspaces"] == null ? [] : List<Workspace>.from(json["workspaces"]!.map((x) => Workspace.fromJson(x))),
    campaigns: json["campaigns"] == null ? [] : List<dynamic>.from(json["campaigns"]!.map((x) => x)),
    maxWorkspaces: json["maxWorkspaces"],
    storageSizeInBytes: json["storageSizeInBytes"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "subscription": subscription?.toJson(),
    "_id": id,
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
    "workspaces": workspaces == null ? [] : List<dynamic>.from(workspaces!.map((x) => x.toJson())),
    "campaigns": campaigns == null ? [] : List<dynamic>.from(campaigns!.map((x) => x)),
    "maxWorkspaces": maxWorkspaces,
    "storageSizeInBytes": storageSizeInBytes,
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

class Workspace {
  String? id;
  String? name;
  String? color;
  List<dynamic>? uploads;
  String? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Workspace({
    this.id,
    this.name,
    this.color,
    this.uploads,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Workspace.fromJson(Map<String, dynamic> json) => Workspace(
    id: json["_id"],
    name: json["name"],
    color: json["color"],
    uploads: json["uploads"] == null ? [] : List<dynamic>.from(json["uploads"]!.map((x) => x)),
    user: json["user"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "color": color,
    "uploads": uploads == null ? [] : List<dynamic>.from(uploads!.map((x) => x)),
    "user": user,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
