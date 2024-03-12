import 'package:flutter/material.dart';
import 'package:qrbats/components/buttons/round_button.dart';
import 'package:qrbats/components/text_field/list_input_field.dart';
import 'package:qrbats/pages/signup_page3.dart';

import '../components/texts/TextBlue.dart';

class SignUp2 extends StatefulWidget {
  final String studentName;
  final String indexNumber;
  final String email;

  const SignUp2({Key? key, required this.studentName, required this.indexNumber, required this.email}) : super(key: key);

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  String? selectedDepartment;
  int? selectedCurrentSemester;
  String? selectedStudentRole;

  final List<String> departmentList = ["DEIE", "DCOM", "DMME", "DMENA", "DCEE"];

  void previousPage() {
    Navigator.pop(context);
  }

  void nextPage() {
    if (selectedCurrentSemester != null && selectedDepartment != null) {
      int selectedDepartmentId = departmentList.indexOf(selectedDepartment!) + 1;

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return SignUp3(
            studentName: widget.studentName,
            indexNumber: widget.indexNumber,
            email: widget.email,
            studentRole: selectedStudentRole.toString(),
            departmentId: selectedDepartmentId,
            currentSemester: selectedCurrentSemester ?? 0,
          );
        }),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter valid values for Department and Current Semester')),
      );
    }
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
              SizedBox(height: 35),
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
                        TextBlue(text: "2.Student Details", fontSize: 25),
                        SizedBox(height: 30),
                        TextBlue(text: "Select One", fontSize: 20),
                        _buildListInputField(
                          hintText: "select one",
                          width: screenWidth * 0.8,
                          icon: Icons.list_sharp,
                          options: ["UORSTUDENT", "OTHERS"],
                          initialValue: "UORSTUDENT",
                          onChanged: (selectedValue) {
                            selectedStudentRole = selectedValue;
                          },
                        ),
                        SizedBox(height: 40),
                        TextBlue(text: "Department", fontSize: 20),
                        SizedBox(height: 10),
                        _buildListInputField(
                          hintText: "select one",
                          width: screenWidth * 0.8,
                          icon: Icons.list_sharp,
                          options: departmentList,
                          initialValue: "DEIE",
                          onChanged: (selectedValue) {
                            selectedDepartment = selectedValue;
                          },
                        ),
                        SizedBox(height: 40),
                        TextBlue(text: "Current Semester", fontSize: 20),
                        SizedBox(height: 10),
                        _buildListInputField(
                          hintText: "select one",
                          width: screenWidth * 0.8,
                          icon: Icons.list_sharp,
                          options: List.generate(8, (index) => (index + 1).toString()),
                          initialValue: "1",
                          onChanged: (selectedValue) {
                            selectedCurrentSemester = int.tryParse(selectedValue ?? "0");
                          },
                        ),
                        SizedBox(height: 40),

                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    RoundButton(onTap: previousPage, icon: Icons.arrow_back),
                    Spacer(),
                    RoundButton(onTap: nextPage, icon: Icons.arrow_forward),
                    SizedBox(width: 20),
                  ],
                ),
              ),
              SizedBox(height: screenHeight*0.05,)
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

  Widget _buildListInputField({
    required String hintText,
    required double width,
    required IconData icon,
    required List<String> options,
    String? initialValue,
    required Function(String?) onChanged,
  }) {
    return ListInputFieldWidget(
      hintText: hintText,
      width: width,
      icon: Icon(icon),
      options: options,
      initialValue: initialValue,
      onChanged: onChanged,
    );
  }
}
