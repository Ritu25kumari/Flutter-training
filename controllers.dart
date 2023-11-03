import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'model.dart';
import 'package:flutter/material.dart';

class UserController extends GetxController {
 // UserInfoModel? userinfomodel;

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  final userlist = <UserInfoModel>[];

  @override
  void onInit() async{
    super.onInit();
    getUserData();
  }
  void getUserData() async{
    try {
     final users = await GetApi().fetchUsersData();
     //userlist[1].id = generateid();
     userlist.addAll(users);
     update();
    }
    catch(e){
      print('Error: $e');
      return null;
    }

  }
  void addUserData(UserInfoModel  adduser, ) {
    userlist.add(adduser);
    userlist[1].id = generateid();
    update();
  }
  void deleteUserData(int index){
    if(index>=0 && index<userlist.length){
      userlist.removeAt(index);
      update();
    }
  }
  String generateid(){
    return DateTime.now().millisecond.toString();
  }
}

class GetApi {
  Future<List<UserInfoModel>> fetchUsersData() async {
    final  response = await http.get(Uri.parse('https://gorest.co.in/public/v2/users'));
    if (response.statusCode == 200) {
     final List<dynamic> userJsonList = json.decode(response.body);
     final List<UserInfoModel> users = userJsonList.map((userJson){
       return UserInfoModel.fromJson(userJson);
     }).toList();
     return users;
    } else {
      throw Exception('Network problem');
    }
  }

}