import 'package:flutter/material.dart';
import 'package:qrbats/components/buttons/round_button.dart';
import 'package:qrbats/components/text_field/text_field.dart';
import 'package:qrbats/components/texts/TextBlue.dart';
import 'package:qrbats/pages/login_page.dart';
import 'package:qrbats/pages/opening_page.dart';
import 'package:qrbats/pages/signup_page2.dart';
import 'package:qrbats/pages/signup_page3.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _studentNameTextController = TextEditingController();
  final _indexNumberTextController = TextEditingController();
  final _emailTextController = TextEditingController();

  void nextPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return SignUp2(studentName: _studentNameTextController.text,email: _emailTextController.text,indexNumber: _indexNumberTextController.text,);
        }));
  }

  void previousPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return OpennigPage();
        }));
  }

  void loginPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return Login();
        }));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              SizedBox(height: 25),
              Center(child: TextBlue(text: "SignUp", fontSize: 30)),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: screenHeight * 0.65,
                  width: screenWidth * 0.9,
                  decoration: _buildContainerDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        SizedBox(height: 20),
                        TextBlue(text: "1.Student Details", fontSize: 25),

                        SizedBox(height: 30),
                        TextBlue(text: "Student Name", fontSize: 20),
                        SizedBox(height: 10),
                        MyTextField(
                          controller: _studentNameTextController,
                          hintText: "student name",
                          width: screenWidth * 0.8,
                          obscureText: false,
                          icon: Icon(Icons.drive_file_rename_outline),
                        ),
                        SizedBox(height: 40),
                        TextBlue(text: "Index Number", fontSize: 20),
                        SizedBox(height: 10),
                        MyTextField(
                          controller: _indexNumberTextController,
                          hintText: "index number",
                          width: screenWidth * 0.8,
                          obscureText: false,
                          icon: Icon(Icons.numbers),
                        ),
                        SizedBox(height: 40),
                        TextBlue(text: "Email Address", fontSize: 20),
                        SizedBox(height: 10),
                        MyTextField(
                          controller: _emailTextController,
                          hintText: "email",
                          width: screenWidth * 0.8,
                          obscureText: false,
                          icon: Icon(Icons.email),
                        ),
                        SizedBox(height: 40),

                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      "If you already have an account? ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                    TextButton(onPressed: loginPage, child: Text("SignIn", style: TextStyle(color: Color(0xFF086494)),)),
                    Spacer(),
                  ],
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    RoundButton(onTap: previousPage,icon: Icons.arrow_back,),
                    Spacer(),
                    RoundButton(onTap: nextPage, icon: Icons.arrow_forward,),
                    SizedBox(width: 20,),
                  ],
                ),
              ),
              SizedBox(height: screenHeight*0.05,),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border(
        top: BorderSide(
          color: Color(0xFF086494),
          width: 6.0,
        ),
        bottom: BorderSide(
          color: Color(0xFF086494),
          width: 1.0,
        ),
        left: BorderSide(
          color: Color(0xFF086494),
          width: 1.0,
        ),
        right: BorderSide(
          color: Color(0xFF086494),
          width: 1.0,
        ),
      ),
    );
  }

}
