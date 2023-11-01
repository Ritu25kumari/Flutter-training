import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'cartmodel.dart';
import 'getx2.2_homescreen.dart';
import 'package:http/http.dart' as http;
class CartController extends GetxController{
  final cartList = <CartModel>[];
  CartModel? cartModel;
  Products? products;
  TextEditingController totalController = TextEditingController();
  TextEditingController discountedtotalController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  deleteCartData(String id) async{
    var token = 'token_id';
    try{
     var response = await http.delete(Uri.parse('https://dummyjson.com/carts/$id'),
       headers: {
         'Content-Type': 'application/json',
         'Accept': 'application/json',
         'Authorization': 'Bearer $token'
       },
     );
     if(response.statusCode==200){
         print(response.body);
         update();
     }
     else{
       print('cart not deleted');
     }
    }
    catch(e){
       print(e);
    }
  }

  updateUserData(String id) async {
    var token =
        'token_id';
    try {
      var body = {
        'total':totalController.text,
        'discountedtotal': discountedtotalController.text,
        'userId': userIdController.text,
      };

      var response = await http.put(Uri.parse('https://dummyjson.com/carts/$id'),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        print('data updated');
        update();
      } else {
        print('response status code not 200');
      }
    } catch (e) {
      print(e);
    }
  }

   @override
   void onInit() async{
     super.onInit();
     getCart();
   }
   void getCart() async{
    try{
      final cartData = await GetApi().fetchUsersData();

      final cartZ = cartData.carts?.map((cartX){
        return CartModel(
          carts: [cartX],
          total: cartData.total,
          skip: cartData.skip,
          limit: cartData.limit
        );
      }).toList();
      if(cartZ!=null){
        cartList.assignAll(cartZ);
      }
      update();
    }
    catch(e){
      print('error$e');
    }
  }
}