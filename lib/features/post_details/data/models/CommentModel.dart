/// id : 69885
/// post_id : 85433
/// name : "mohamed"
/// email : "mo@g.com"
/// body : "bbbb"

class CommentModel {
  CommentModel({
      this.id, 
      this.postId, 
      this.name, 
      this.email, 
      this.body,});

  CommentModel.fromJson(dynamic json) {
    id = json['id'];
    postId = json['post_id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
  int? id;
  int? postId;
  String? name;
  String? email;
  String? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['post_id'] = postId;
    map['name'] = name;
    map['email'] = email;
    map['body'] = body;
    return map;
  }
  @override
  String toString() {
    // TODO: implement toString
    return "$id : $postId : $name : $email : $body";
  }
}