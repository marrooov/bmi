import 'package:bmi/result_screen.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = true;
  bool isMale = true;
  double height = 150;
  int weight = 70;
  int age = 26;
  double calculateBMI() {
  return weight / ((height / 100) * (height / 100));
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor:
    isDarkMode
        ? const Color(0xFF1C2135)
        : Colors.white,
        appBar: AppBar(
          elevation: 50,
          centerTitle: true,
          backgroundColor: Color(0xFF1C2135),
          leading: Switch(
            value: isDarkMode,
           onChanged: (value) {
            setState(() {
              isDarkMode = value;
            });
          }),
          title: Text(
            'BMI Calculator',
            style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFFFFF),
          ),
          ),
      ),
       body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16.0),
         child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  GenderWidget(
                    iconPath: 'assets/icons/male_icon.png',
                     gender: 'Male',
                     isSelected: isMale == true,
                     onTap: (){
                      isMale = true;
                      setState(() {
                        
                      });
                     },
                     ),
                  GenderWidget(
                    iconPath: 'assets/icons/female_icon.png',
                     gender: 'Female',
                     isSelected: isMale == false,
                      onTap: (){
                      isMale = false;
                      setState(() {
                        
                      });
                      },
                     ),
                ]
              ),
             ),
             Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff24263B),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Height',
                    style: TextStyle( 
                      fontWeight: FontWeight.w300,
                       fontSize: 20,
                        color: Color(0xFF8B8C9E)),
                    ),
                    Text.rich(
                      TextSpan(
                        text: height.round().toString(),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF),
                        ),
                        children: [
                          TextSpan(
                            text: 'cm',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ]
                      )
                    ),
                    Slider(
                      activeColor: Color(0xFFE83D67),
                      value: height,
                      min: 50,
                      max: 200,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ]
                ),
              ),
             ),
              Expanded( 
                child: Row(
                  spacing: 10,
                  children: [
              InfoUserWidget(
                title: 'Weight',
                 value: weight,
                  addOnPressed: () {
                    if(weight >= 0){
                    weight++;
                    setState(() {});
                    }

                  },
                   removeOnPressed: () {
                    if(weight > 0) {
                      weight--;
                      setState(() {});
                    }
                    
                   }
                   ),
              InfoUserWidget(
                title: 'Age',
                 value: age,
                  addOnPressed: () {
                    if(age >= 0){
                      age++;
                    setState(() {});
                    }
                  },
                   removeOnPressed: () {
                    if(age > 0) {
                      age--;
                      setState(() {});
                    }
                   }
                   ),
          ])
          ),
         ]
         ),
         ),
         bottomNavigationBar: MaterialButton(
          onPressed: () {
            log('is Male: $isMale');
            log('Weight: $weight');
            log('Height: $height');
            log('Age: $age');
            double bmi = calculateBMI();

            Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => ResultPage(
              bmi: bmi,
                ),
              ),
            );
          },
          color: Color(0xFFE83D67),
         child: Padding(
           padding: const EdgeInsets.all(30),
           child: Text('Calculate',
           style: TextStyle(
             fontWeight: FontWeight.w600, fontSize: 32,color: Color(0xFFFFFFFF),
           ),
           ),
         )
         )
         );
  }
}

class InfoUserWidget extends StatelessWidget {
   InfoUserWidget({
    super.key,required this.title, required this.value , this.addOnPressed, this.removeOnPressed
  });
String title;
int value;
void Function()? addOnPressed;
void Function()? removeOnPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
     child: Row(
       spacing:10,
       children: [
         Expanded(
           child: Container(
             margin: EdgeInsets.symmetric(vertical: 20),
             decoration: BoxDecoration(
               color: Color(0xff24263B),
               borderRadius: BorderRadius.circular(12),
             ),
             child: Column(
               children: [
                 Text(title,
                 style: TextStyle( 
                   fontWeight: FontWeight.w400,
                    fontSize: 20,
                     color: Color(0xFF8B8C9E)),
                 ),
                 Text(
                   value.toString(),
                   style: TextStyle(
                     fontSize: 40,
                     fontWeight: FontWeight.w700,
                     color: Color(0xFFFFFFFF),
                   ),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     FloatingActionButton(
                       onPressed: addOnPressed,
                       backgroundColor: Color(0xFF8B8C9E),
                       shape: CircleBorder(),
                       child: Icon(Icons.add),
                     ),
                     FloatingActionButton(
                       onPressed: removeOnPressed,
                       backgroundColor: Color(0xFF8B8C9E),
                       shape: CircleBorder(),
                       child: Icon(Icons.remove),
                     ),
                   ]
                 )
               ],
             ),
           ),
         ),
       ],
     ),
    );
  }
}

class GenderWidget extends StatelessWidget {
 GenderWidget({
    super.key,required this.iconPath, required this.gender, required this.onTap, required this.isSelected
  });
String iconPath;
String gender;
void Function() onTap;
bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ?  Color(0xff24263B): Color(0xFF333244) ,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? Color(0xFFFFFFFF) : Color(0xFF333244),
              )
            ),
            margin: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Image.asset(iconPath,height: 130),
            
            Text(gender,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
            )
            ),
          ]
        ),
        ),
      ),
    ));
  }
}