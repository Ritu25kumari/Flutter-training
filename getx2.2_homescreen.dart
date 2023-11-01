import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'cartmodel.dart';
import 'getx2.1_controller.dart';

class GetApi {
  Future<CartModel> fetchUsersData() async {
    var response = await http.get(Uri.parse('https://dummyjson.com/carts'));
    if (response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> data = json.decode(response.body);
      final cartresponse = CartModel.fromJson(data);
      print(cartresponse);
      return cartresponse;
    } else {
      throw Exception('Network problem');
    }
  }
}
class CartListView extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  TextEditingController cartIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Cart data'),
        actions: [
          ElevatedButton(child: Icon(Icons.add),
          onPressed: (){
            Get.bottomSheet(
              Container(
                color: Colors.teal,
                height: 450,
                child: ListView(
                  children: [
                    TextButton(child: Text('clear'),
                      onPressed: (){
                      cartController.totalController.clear();
                      cartController.discountedtotalController.clear();
                      cartController.userIdController.clear();
                      },
                    ),
                    TextFormField(
                      controller: cartController.totalController,
                      decoration: InputDecoration(hintText: 'total',),
                    ),
                    TextFormField(
                      controller: cartController.discountedtotalController,
                      decoration: InputDecoration(hintText: 'discounted total'),
                    ),
                    TextFormField(
                      controller: cartController.userIdController,
                      decoration: InputDecoration(hintText: 'userid'),
                    ),
                    TextFormField(
                      controller: cartIdController,
                      decoration: InputDecoration(hintText: 'id'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(child: Text('delete data'),
                    onPressed: (){
                      cartController.deleteCartData(cartIdController.text);
                    },),
                    ElevatedButton(child: Text('update data'),
                    onPressed: (){
                      cartController.updateUserData(cartIdController.text);
                    },)
                  ],
                )
              )
            );
          },)
        ],
      ),
      body: GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.cartList.length,
            itemBuilder: (context, index) {
              final cart1 = controller.cartList[index];
              if(cart1.carts!=null && cart1.carts!.isNotEmpty){
                final cart2 = cart1.carts![0];
                return Card(
                  child: ListTile(
                     subtitle: Column(
                       children: [
                         Text('${cart2.id}'),
                         Text('${cart2.total}'),
                         Text('${cart2.discountedTotal}'),
                         Text('${cart2.userId}'),
                         // ElevatedButton(child: Icon(Icons.delete),
                         //  onPressed:(){
                         //    cartController.deleteCartData(cartIdController.text);
                         //  } ,)
                       ],
                     ),
                  ),
                );
              }
              else{
                return ListTile(
                  title: Text('error'),
                );
              }
            }
          );
        },
      ),
    );
  }
}


