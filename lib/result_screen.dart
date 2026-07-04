import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;

  const ResultPage({
    super.key,
    required this.bmi,
  });

  String getResult() {
    if (bmi >= 25) {
      return "Overweight";
    } else if (bmi >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  Color getResultColor() {
    if (bmi >= 25) {
      return Colors.orange;
    } else if (bmi >= 18.5) {
      return const Color(0xFF21BF73);
    } else {
      return Colors.redAccent;
    }
  }

  String getDescription() {
    if (bmi >= 25) {
      return "You have a higher than normal body weight.";
    } else if (bmi >= 18.5) {
      return "You have a normal body weight.\nGood Job.";
    } else {
      return "You have a lower than normal body weight.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2135),

      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF1C2135),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Your Result",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: Container(

                width: double.infinity,

                decoration: BoxDecoration(
                  color: const Color(0xFF333244),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text(
                      getResult(),
                      style: TextStyle(
                        color: getResultColor(),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 25),

                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      "Normal BMI range",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "18.5 - 24.9 kg/m²",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 35),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),

                      child: Text(
                        getDescription(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SizedBox(
        height: 85,

        child: MaterialButton(
          color: const Color(0xFFE83D67),

          onPressed: () {
            Navigator.pop(context);
          },

          child: const Text(
            "RE-CALCULATE",
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}