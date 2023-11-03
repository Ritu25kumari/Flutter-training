class UserInfoModel {
  var id;
  var name;
  var email;
  var gender;
  var status;

  UserInfoModel({this.id, this.name, this.email, this.gender, this.status});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['status'] = this.status;
    return data;
  }
}






// class UserModel {
//   UserModel({this.id,
//     required this.name,
//     required this.email,
//     required this.gender,
//   });
//   late final int id;
//   late final String name;
//   late final String email;
//   late final String gender;
//
//   UserModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     gender = json['gender'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['email'] = email;
//     _data['gender'] = gender;
//     return _data;
//   }
// }
//
