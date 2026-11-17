import 'package:contuct_app/src/pages/contact_form_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/contact_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact List'), centerTitle: true),

      body: Obx(() {
        return ListView.builder(
          itemCount: controller.contactList.length,

          itemBuilder: (context, index) {
            final contact = controller.contactList[index];

            return Card(
              child: ListTile(
                title: Text(contact.name),

                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(contact.phone), Text(contact.profession)],
                ),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Edit
                    IconButton(
                      onPressed: () {
                        Get.to(() => AddPage(index: index));
                      },
                      icon: const Icon(Icons.edit),
                    ),

                    // Delete
                    IconButton(
                      onPressed: () {
                        Get.dialog(
                          AlertDialog(
                            title: const Text('Delete Contact'),
                            content: const Text(
                              'Are you sure you want to delete this contact?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.deleteContact(index);
                                  Get.back();
                                  Get.snackbar(
                                    'Success',
                                    'Contact deleted successfully',
                                  );
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
