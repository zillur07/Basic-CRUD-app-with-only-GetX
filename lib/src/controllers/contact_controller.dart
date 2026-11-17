import 'package:contuct_app/src/models/contuct_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  RxList<ContactModel> contactList = <ContactModel>[].obs;

  // Add
  void addContact(ContactModel contact) {
    contactList.add(contact);
    Get.back();
    Get.snackbar('Success', 'Contact added successfully');
  }

  // Update
  void updateContact(int index, ContactModel contact) {
    contactList[index] = contact;
    Get.back();
    Get.snackbar('Success', 'Contact updated successfully');
  }

  // Delete
  void deleteContact(int index) {
    contactList.removeAt(index);
    Get.snackbar('Success', 'Contact deleted successfully');
  }
}
