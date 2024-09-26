import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: BmiScreen(),
    );
  }
}

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

enum GenderType { male, female }

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController heightController =
      TextEditingController(text: "0");
  final TextEditingController weightController =
      TextEditingController(text: "0");
  GenderType gender = GenderType.male;
  int age = 0;
  double bmi = 0;
  void incrementAge() {
    age++;
    setState(() {});
  }

  void decrementAge() {
    if (age > 0) {
      age--;
      setState(() {});
    }
  }

  setGenderType(GenderType type) {
    gender = type;
    setState(() {});
  }

  calculateBmi() {
    double heightInMeters = (int.parse(heightController.text) / 100);
    if (heightInMeters != 0 && int.parse(weightController.text) != 0) {
      bmi = int.parse(weightController.text) /
          (heightInMeters * heightInMeters).ceilToDouble();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade900,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [0.5, 0.5],
            begin: Alignment(1, -0.4),
            end: Alignment(0, -0.6),
            colors: [
              Color(0xff202020).withOpacity(0.92),
              Color(0xff181818).withOpacity(0.91),
            ],
          ),
        ),
        child: SafeArea(
          child: bmi == 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      "BMI Calculator",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "What are you?",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => setGenderType(GenderType.male),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: gender == GenderType.male
                                      ? null
                                      : Color(0xff101010).withOpacity(0.7),
                                  shape: BoxShape.circle,
                                  gradient: gender == GenderType.male
                                      ? LinearGradient(
                                          colors: [
                                            Color(0xff00ffcc),
                                            Color(0xff00ffff),
                                          ],
                                        )
                                      : null,
                                ),
                                child: Icon(
                                  Icons.male,
                                  size: 48,
                                  color: gender == GenderType.male
                                      ? Colors.black87
                                      : Colors.white,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                "Male",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 64),
                        GestureDetector(
                          onTap: () => setGenderType(GenderType.female),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: gender == GenderType.female
                                      ? null
                                      : Color(0xff101010).withOpacity(0.7),
                                  shape: BoxShape.circle,
                                  gradient: gender == GenderType.female
                                      ? LinearGradient(
                                          colors: [
                                            Color(0xff00ffcc),
                                            Color(0xff00ffff),
                                          ],
                                        )
                                      : null,
                                ),
                                child: Icon(
                                  Icons.female,
                                  size: 48,
                                  color: gender == GenderType.female
                                      ? Colors.black87
                                      : Colors.white,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                "Female",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 80,
                      thickness: 1,
                      color: Colors.grey.shade700,
                    ),
                    Text(
                      "What's your age",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          age.toString().padLeft(2, age > 9 ? '' : '0'),
                          style: TextStyle(
                              fontSize: 56,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        SizedBox(width: 6),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () => incrementAge(),
                              child: Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            GestureDetector(
                              onTap: () => decrementAge(),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Divider(
                      height: 80,
                      thickness: 1,
                      color: Colors.grey.shade700,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What's your height",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 16),
                            RichText(
                              text: WidgetSpan(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IntrinsicWidth(
                                      child: SizedBox(
                                        height: 40,
                                        child: TextField(
                                          controller: heightController,
                                          cursorColor: Colors.white,
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.next,
                                          maxLines: 1,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(3),
                                          ],
                                          style: TextStyle(
                                              fontSize: 56,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                          cursorHeight: 40,
                                          decoration: InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "cm",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                style: TextStyle(
                                    fontSize: 56,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What's your weight",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 16),
                            RichText(
                              text: WidgetSpan(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IntrinsicWidth(
                                      child: SizedBox(
                                        height: 40,
                                        child: TextField(
                                          controller: weightController,
                                          cursorColor: Colors.white,
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.done,
                                          maxLines: 1,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(2),
                                          ],
                                          style: TextStyle(
                                              fontSize: 56,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                          cursorHeight: 40,
                                          decoration: InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "kg",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                style: TextStyle(
                                    fontSize: 56,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 120),
                    InkWell(
                        onTap: () => calculateBmi(),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff00ffff),
                                Color(0xff00ffcc),
                              ],
                            ),
                          ),
                          child: Text(
                            "Calculate Your BMI",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                        )),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.balance_outlined,
                      size: 120,
                      color: Color(0xff00ffff),
                    ),
                    Text(
                      bmi.toString(),
                      style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 12),
                    Text(
                      switch (bmi) {
                        < 18.5 => "You are Underweight",
                        > 25.0 && < 30 => "You are Overweight",
                        > 30 => "You are Obese",
                        _ => "Your have Normal body weight",
                      },
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff00ffcc)),
                    ),
                    TextButton(
                      onPressed: () {
                        bmi = 0;
                        age = 0;
                        heightController.text = "0";
                        weightController.text = "0";
                        setState(() {});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Color(0xff00ffcc),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Reset",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff00ffcc)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
