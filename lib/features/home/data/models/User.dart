class User {
  User({
      this.id, 
      this.name, 
      this.email, 
      this.gender, 
      this.status,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    status = json['status'];
  }
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['gender'] = gender;
    map['status'] = status;
    return map;
  }
  @override
  String toString() {
    // TODO: implement toString
    return "$id : $name : $email : $gender : $status";
  }

}