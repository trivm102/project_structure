
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/controllers/login_controller.dart';
import 'package:project_structure/utils/dimensions.dart';

class LoginScreen extends StatelessWidget {
  var _phoneNumber = '';
  var _password = '';
  late LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Column( mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Container(
            width: size.width * 0.8,
            height: 50,
            child: TextField(
              onChanged: (value) {
                  _phoneNumber = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone Number',
              ),
            ),
          ),
          Container(
            width: Dimensions.textFieldWidth,
            height: 50,
            margin: EdgeInsets.only(top: 20),
            child: TextField(
              obscureText: true,
              onChanged: (value) {
                  _password = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
            width: Dimensions.textFieldWidth,
            height: 50,
            margin: EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () {
                print('phone number: $_phoneNumber');
                print('password: $_password');
                //loginController.getData();
                loginController.login('0198558833', '12345678');
              },
              child: Text('Login', style: TextStyle(fontSize: 24)),
            ),
          ),
        ])
        ),
      );
  }
}
