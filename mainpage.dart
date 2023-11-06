import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ritu_trainee/dummy_statemanagement/controllers.dart';
import 'package:ritu_trainee/dummy_statemanagement/model.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Users Information',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.purple[400],
        actions: [
          IconButton(icon: Icon(Icons.add,color: Colors.white,),
          onPressed: (){
            Get.bottomSheet(
                Container(
                  height: 600,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                       color: Colors.purple[100],
                  ),
                  child: GetBuilder<UserController>(
                    builder: (controller){
                      return SingleChildScrollView(
                        child: Column(
                        children: [
                          Center(child: Text('Add new User',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20), )),
                          TextFormField(
                            controller: controller.idController,
                            decoration: InputDecoration(hintText: 'id'),
                            validator: (id){
                              if( id == controller.userlist[0].id){
                                return 'enter valid id ';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: controller.nameController,
                            decoration: InputDecoration(hintText: 'name'),
                          ),
                          TextFormField(
                            controller: controller.emailController,
                            decoration: InputDecoration(hintText: 'email'),
                          ),
                          TextFormField(
                            controller: controller.genderController,
                            decoration: InputDecoration(hintText: 'gender'),
                          ),
                          TextFormField(
                            controller: controller.statusController,
                            decoration: InputDecoration(hintText: 'status'),
                          ),
                          ElevatedButton(child: Text('add'),
                          onPressed: (){
                            final adduser = UserInfoModel(
                              id: controller.idController.text,
                              name: controller.nameController.text,
                              email: controller.emailController.text,
                              gender: controller.genderController.text,
                              status: controller.statusController.text
                            );
                            controller.addUserData(adduser);
                            Get.back();
                            controller.idController.clear();
                            controller.nameController.clear();
                            controller.statusController.clear();
                            controller.genderController.clear();
                            controller.emailController.clear();
                          },)
                        ],),
                      );
                    },
                  ),
                )
            );
          },)
        ],
      ),
      body: GetBuilder<UserController>(
        init: UserController(),
        builder: (controller)
        {
         return ListView.builder(
              itemCount: controller.userlist.length,
              itemBuilder: (context , index){
                if(controller.userlist!=null && controller.userlist.isNotEmpty){
                  return Card(
                    child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Text('${controller.userlist[index].id}'),
                              IconButton(icon: Icon(Icons.delete),
                              onPressed: (){
                                controller.deleteUserData(index);
                              },)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${controller.userlist[index].name}'),
                              IconButton(icon: Icon(Icons.edit),
                                onPressed: (){
                                controller.updateUserData(controller.userlist[index].id.toString());
                                },)
                            ],
                          ),
                          Text('${controller.userlist[index].email}'),
                          Text('${controller.userlist[index].gender}'),
                          Text('${controller.userlist[index].status}'),
                        ],
                      ),
                    ),
                  );
                }
          });
        },
      )
    );
  }
}
