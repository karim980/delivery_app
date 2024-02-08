import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';

class UserController extends GetxController{
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  late UserModel user;

  Future<void> addUser({
    required String name,
    required String docId,
    required String address,
    required String phone,

  }) {
    return users
        .doc(docId)
        .set({
      'name': name,
      'address':address,
      'phone':phone,
    })
        .then((value) => debugPrint("User Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }

  Future<UserModel?> getUserInformation(String userId) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        user = UserModel(
          name: data['name'], address: data['address'], phone: data['phone'],

        );
        return user;
      } else {
        return null;
      }
    } catch (error) {
      print('Error retrieving user information: $error');
      return null;
    }
  }
}