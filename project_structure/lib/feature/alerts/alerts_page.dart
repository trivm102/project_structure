import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/feature/alerts/alerts_controller.dart';

class AlertsPage extends GetView<AlertsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Alerts Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
