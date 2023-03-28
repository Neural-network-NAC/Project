import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/splash.jpg",
              height: 300,
            ),
            Container(
                padding: EdgeInsets.symmetric(),
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  "Your SmartStore Assist",
                  style: TextStyle(
                    color: Color(0xff00A368),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context,
                      "homePage"); //Won't go back to this screen again becaused I used pushed replacement
                },
                child: Ink(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff00A368)),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
