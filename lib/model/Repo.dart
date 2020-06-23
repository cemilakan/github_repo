// To parse this JSON data, do
//
//     final rpo = rpoFromJson(jsonString);

import 'dart:convert';


List<Repo> allReposFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Repo>.from(jsonData.map((x) => Repo.fromJson(x)));
}

String allReposToJson(List<Repo> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

Repo repoFromJson(String str) => Repo.fromJson(json.decode(str));

String repoToJson(Repo data) => json.encode(data.toJson());

class Repo {
  Repo({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.owner,
    this.htmlUrl,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.language,
  });

  int id;
  String nodeId;
  String name;
  String fullName;
  Owner owner;
  String htmlUrl;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime pushedAt;
  String language;

  factory Repo.fromJson(Map<String, dynamic> json) => Repo(
    id: json["id"],
    nodeId: json["node_id"],
    name: json["name"],
    fullName: json["full_name"],
    owner: Owner.fromJson(json["owner"]),
    htmlUrl: json["html_url"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pushedAt: DateTime.parse(json["pushed_at"]),
    language: json["language"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "node_id": nodeId,
    "name": name,
    "full_name": fullName,
    "owner": owner.toJson(),
    "html_url": htmlUrl,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pushed_at": pushedAt.toIso8601String(),
    "language": language,
  };
}

class Owner {
  Owner({
    this.login,
    this.id,
    this.avatarUrl,
  });

  String login;
  int id;
  String avatarUrl;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    login: json["login"],
    id: json["id"],
    avatarUrl: json["avatar_url"],
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "id": id,
    "avatar_url": avatarUrl,
  };
}
