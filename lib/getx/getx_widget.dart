
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getx_controller.dart';


class GetxWidget extends StatelessWidget {
  const GetxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      //there are two ways to use GetX for state management

      // body: GetBuilder<UserController>(
      //   builder: (controller) {
      //     if (controller.status == UserStatus.loading) {
      //       return const CircularProgressIndicator();
      //     }
      //
      //     if (controller.errorMessage != null) {
      //       return Text('Error: ${controller.errorMessage}', style: const TextStyle(color: Colors.red));
      //     }
      //
      //     if (controller.user != null) {
      //       return Text('Hello, ${controller.user.value?.name}, Age: ${controller.user.value?.age}');
      //     }
      //
      //     return const Text('No user loaded yet.');
      //   },
      // ),
      body: Center(
        child: Obx(() {
          switch (controller.status.value) {
            case UserStatus.initial:
              return const Text('Click the button to load user.');
            case UserStatus.loading:
              return const CircularProgressIndicator();
            case UserStatus.success:
              return Text('Hello, ${controller.user.value?.name}, Age: ${controller.user.value?.age}');
            case UserStatus.error:
              return Text(controller.errorMessage.value, style: const TextStyle(color: Colors.red));
          }
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: controller.fetchUser,
            child: const Icon(Icons.download),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => Get.toNamed('/second'),
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
