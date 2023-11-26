import 'package:flutter/material.dart';
import 'package:lorthew/Screens/customnavbar.dart';
void main() => runApp( Register());

class Register extends StatefulWidget {
  // const Register(super.key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget build(BuildContext context){
    return registerScreen();
  }
  

  Widget registerScreen(){

    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
