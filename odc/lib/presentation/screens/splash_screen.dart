import 'package:flutter/material.dart';
import 'package:odc/presentation/screens/login/loginscreen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Image.asset(
           "images/orange.jpg",
            height: MediaQuery.of(context).size.height / 11,
            width: MediaQuery.of(context).size.width / 1.5,
            fit: BoxFit.cover,
          ),

          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LinearPercentIndicator(
              animation: true,
              lineHeight: 7.0,
              animationDuration: 2500,
              percent: 1,
              barRadius: const Radius.circular(50),
              progressColor: Colors.orange,
              onAnimationEnd: () {

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => loginScreen(),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
