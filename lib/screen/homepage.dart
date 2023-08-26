import 'package:dummhyrestgetx/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: controller.isLoading.value
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: controller.restList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          color: Colors.cyanAccent,
                          child: Column(
                            children: [
                              Text('data:${controller.restList[index].id}'),
                              Text(
                                  'data:${controller.restList[index].employeeName}'),
                              Text(
                                  'data:${controller.restList[index].employeeAge}'),
                              Text(
                                  'status:${controller.restList[index].employeeAge}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
