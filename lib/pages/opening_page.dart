import 'package:flutter/material.dart';
import 'package:qrbats/components/buttons/button_white.dart';
import 'package:qrbats/pages/signup_page1.dart';

class OpennigPage extends StatefulWidget {
  const OpennigPage({super.key});

  @override
  State<OpennigPage> createState() => _OpennigPageState();
}

class _OpennigPageState extends State<OpennigPage> {

  void getStart() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return SignUp();
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
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50, bottom: 50),
                            child: Text(
                              "W E L C O M E",
                              style: TextStyle(
                                  color: Color(0xFF086494),
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Image(image: AssetImage("lib/assets/logo/logo.png"),height: screenHeight*0.3,),
                        ],
                      ),
                    ),
                  ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF086494),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100.0),
                    bottomLeft: Radius.circular(100.0),
                  ),
                ),
                //color: Colors.white,
                height: screenHeight*0.3,
                child: Center(child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 30, left: 30,right: 35),
                      child: Center(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                  "This is the best app to take Attendance using QR code with GPS tracking",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18
                                  )))),
                    ),
                    Container(height: screenHeight*0.07, child: MyButtonWhite(onTap: getStart, text: "Get Start",width: 200,)),
                  ],
                )),
              ),
                  SizedBox(height: 30,),
                ]),
          ),
        ));
  }


}
