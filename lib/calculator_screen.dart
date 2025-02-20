import 'package:flutter/material.dart';
import 'package:flutter_state_management/result.dart';
import 'package:get/get.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  //declare controler
  var firstController = TextEditingController();
  var secondController = TextEditingController();

  //text for result
  //String result = "0";

  //getx
  var result = "0".obs;
  var result2 = "0";

  calculateBMI(String firstNumber, String secondNumber) {
    // int first = int.parse(firstNumber);
    // int second = int.parse(secondNumber);

    double weight = double.parse(firstNumber);
    double height = double.parse(secondNumber);

    double bmi = weight / (height * height);
    String category;
    // setState(() {
    //   result = sum.toString();
    // });
    if (bmi < 18.5) {
      category = "uderweight 😟";
    } else if (bmi >= 18.5 && bmi < 25) {
      category = "Normal weight  😊";
    } else if (bmi >= 25 && bmi < 29.9) {
      category = "Overweight 😐";
    } else {
      category = "Obese 😨";
    }

    //getx
    result.value = "BMI: ${bmi.toStringAsFixed(2)}\nCategory: ${category}";
    result2 = result.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Weight in kg",
                  hintText: "0.0",
                  prefixIcon: Icon(Icons.rectangle)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter height in m",
                  hintText: "0.0",
                  prefixIcon: Icon(Icons.rectangle)),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              String firstNumber = firstController.text;
              String secondNumber = secondController.text;

              if (firstNumber.isNotEmpty && secondNumber.isNotEmpty) {
                //call sum function
                calculateBMI(firstNumber, secondNumber);
                Get.to(Result(
                  calculatedBMI: result2,
                ));
              } else {
                Get.snackbar("Error", "Please enter two number ");
              }
            },
            label: Text("Calculate"),
            icon: Icon(Icons.calculate_outlined),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
          ),
          SizedBox(
            height: 20,
          ),
          // Text(
          //   result,
          //   style: TextStyle(
          //       fontSize: 50, fontWeight: FontWeight.bold, color: Colors.blue),
          // )

          //getx result show korbe    obs goyendaaaa  obx receiver
          // Obx(
          //   () => Text(
          //     result.value,
          //     style: TextStyle(
          //         fontSize: 40,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.blue),
          //   ),
          // ),
        ],
      )),
    );
  }
}
