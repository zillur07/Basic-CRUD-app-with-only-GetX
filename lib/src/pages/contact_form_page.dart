import 'package:contuct_app/src/models/contuct_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/contact_controller.dart';

class AddPage extends StatelessWidget {
  final int? index;

  AddPage({super.key, this.index});

  final controller = Get.find<ContactController>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final professionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Edit data load
    if (index != null && nameController.text.isEmpty) {
      final contact = controller.contactList[index!];

      nameController.text = contact.name;
      phoneController.text = contact.phone;
      professionController.text = contact.profession;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(index == null ? 'Add Contact' : 'Edit Contact'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: professionController,
              decoration: const InputDecoration(
                labelText: 'Profession',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ContactModel contact = ContactModel(
                    name: nameController.text,
                    phone: phoneController.text,
                    profession: professionController.text,
                  );

                  if (index == null) {
                    controller.addContact(contact);
                  } else {
                    controller.updateContact(index!, contact);
                  }
                },

                child: Text(index == null ? 'Save' : 'Update'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
