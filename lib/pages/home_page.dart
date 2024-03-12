import 'package:flutter/material.dart';
import 'package:qrbats/components/buttons/button_dark_small.dart';
import 'package:qrbats/components/texts/TextBlue.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Center(child: TextBlue(text: "Scan QR Code to Mark Attendance", fontSize: 20)),
            SizedBox(height: 40,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border(top: BorderSide(
                  color: Color(0xFF086494),
                  width: 3.0,
                ),
                  bottom: BorderSide(
                    color: Color(0xFF086494),
                    width: 3.0,
                  ),
                  left: BorderSide(
                    color: Color(0xFF086494),
                    width: 3.0,
                  ),
                  right: BorderSide(
                    color: Color(0xFF086494),
                    width: 3.0,
                  ),)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(image: AssetImage("lib/assets/qrcode/qrcode.png"),height: screenHeight*0.4,),
              ),
            ),
            SizedBox(height: 30,),
            MyButtonDS(onTap: (){}, text: "Scan QR Code", width: 200)
          ],
        ),
      ),
    );
  }
}
