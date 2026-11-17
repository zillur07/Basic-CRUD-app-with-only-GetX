import 'package:contuct_app/src/app.dart';
import 'package:contuct_app/src/controllers/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  // Register GetX Controller

  Get.put(ContactController());
  runApp(const App());
}
