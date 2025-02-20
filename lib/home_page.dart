import 'package:flutter/material.dart';
import 'package:flutter_state_management/calculator_screen.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => CalculatorScreen()));
            Get.to(CalculatorScreen());
          },
          label: Text("BMI Calculator"),
          icon: Icon(Icons.calculate_outlined),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
        ),
      ),
    );
  }
}
