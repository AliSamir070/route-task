import 'package:twasol/features/home/data/models/User.dart';

/// id : 85409
/// user_id : 5716284
/// title : "Esse validus stipes recusandae occaecati approbo."
/// body : "Animadverto stillicidium aut. Vereor denuo cunctatio. Creptio minus animus. Dicta comes undique. Titulus adipisci odio. Angelus culpo candidus. Suggero thalassinus advenio. Deduco necessitatibus video. Tabella volaticus colloco. Laudantium vulgus concedo."

class PostModel {
  PostModel({
      this.id, 
      this.userId, 
      this.title, 
      this.body,this.user});

  PostModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    body = json['body'];
  }
  int? id;
  int? userId;
  String? title;
  String? body;
  User? user;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['title'] = title;
    map['body'] = body;
    return map;
  }
  @override
  String toString() {
    // TODO: implement toString
    return "$id : $userId : $title : $body : $user";
  }
}