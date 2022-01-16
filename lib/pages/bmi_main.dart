import 'package:bmi_app/pages/bmi_result.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BmiInput extends StatefulWidget {
  const BmiInput({
    Key? key,
  }) : super(key: key);

  @override
  _BmiInputState createState() => _BmiInputState();
}

class _BmiInputState extends State<BmiInput> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/page2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FormTextfield(),
              SizedBox(
                height: 20,
              ),
              //heightTextfield(),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                   if (_weight.text.isNotEmpty &&
                _height.text.isNotEmpty) {
              Calculator cal = Calculator(double.parse(_weight.text),
                  double.parse(_height.text));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultBmi(
                    bmiResult: cal.calculateBMI(),
                    resultText: cal.resultText(),
                  ),
                ),
              );
            } else {
              showDialog<void>(context: context, builder: (context) => alertDialog());
            }
          },
                child: const Text(
                  'คำนวณ',
                  style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
                    foregroundColor: MaterialStateProperty.all(Colors.brown),
                  ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

 

  Widget FormTextfield() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "กรุณาการอกน้ำหนัก";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'น้ำหนัก (กิโลกรัม)',
                      prefixIcon: Icon(Icons.monitor_weight_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    controller: _height,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "กรุณากรอกส่วนสูง";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'ส่วนสูง (เซนติเมตร)',
                      prefixIcon: Icon(Icons.arrow_upward_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget alertDialog(){
    return AlertDialog(
      title: Row(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              FontAwesomeIcons.exclamationTriangle,
              color: Colors.red,
            ),
          ),
          Text('ไม่มีข้อมูล')
        ],
      ),
      // title: ,
      content: const Text(
        'กรุณากรอกน้ำหนักและส่วนสูง',
        style: TextStyle(fontSize: 18),
      ),

      actions: [
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(const Color(0xFF6200EE)),
          ),
          // textColor: Color(0xFF6200EE),
          onPressed: () => Navigator.pop(context),
          child: const Text('ตกลง'),
        ),
      ],
    );
  }

  
}
class Calculator {
  late double weight;
  late double height;
  double bmi = 0.0;

  Calculator(this.weight, this.height);

  String calculateBMI() {
    bmi = weight / pow((height / 100), 2);

    return bmi.toStringAsFixed(1);
  }

  String resultText() {
    if (bmi < 18.5) {
      return 'น้ำหนักน้อยเกินไป';
    } else if (bmi < 23) {
      return 'น้ำหนักปกติ';
    } else if (bmi < 25) {
      return 'น้ำหนักเกิน (ท้วม)';
    } else if (bmi < 30) {
      return 'อ้วนระดับ 1 (อ้วนระยะเริ่มต้น)';
    } else if (bmi < 40) {
      return 'อ้วนระดับ 2 (อ้วนมาก)';
    } else {
      return 'อ้วนระดับ 3 (อ้วนระดับรุนแรงมาก)';
    }
  }
}


