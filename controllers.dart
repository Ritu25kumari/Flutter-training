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
    userlist[0].id = generateid();
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
  
  void updateUserData(String id){
    final index = userlist.indexWhere((users) => users.id==id);
    if(index!=-1){
      nameController.text = userlist[index].name;
      emailController.text = userlist[index].email;
      genderController.text = userlist[index].gender;
      statusController.text= userlist[index].status;
      Get.bottomSheet(SingleChildScrollView(
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            color: Colors.purpleAccent[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15)
            )
          ),
          child: GetBuilder<UserController>(
            builder: (controller){
              return Column(
                children: [
                  SizedBox(height: 20,),
                  Text('edit user',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20 ),),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      hintText: 'name'
                    ),
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                        hintText: 'email'
                    ),
                  ),
                  TextFormField(
                    controller: controller.statusController,
                    decoration: InputDecoration(
                        hintText: 'status'
                    ),
                  ),
                  TextFormField(
                    controller: controller.genderController,
                    decoration: InputDecoration(
                        hintText: 'gender'
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    userlist[index].name = controller.nameController.text;
                    userlist[index].email = controller.emailController.text;
                    userlist[index].status  = controller.statusController.text;
                    userlist[index].gender = controller.genderController.text;
                  }, child: Text('update'))
                ],
              );
            },
          ),
        ),
      ));
    }
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
