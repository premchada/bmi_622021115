import 'package:bmi_app/pages/bmi_main.dart';
import 'package:flutter/material.dart';


class ResultBmi extends StatefulWidget {
  const ResultBmi({Key? key, required this.bmiResult, required this.resultText}) : super(key: key);

  final String bmiResult;
  final String resultText;


  @override
  _ResultBmiState createState() => _ResultBmiState();

  
}

class _ResultBmiState extends State<ResultBmi> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              
              image: AssetImage('images/page3.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 24.0),
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            'ค่า BMI ของคุณคือ',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Text(
                          widget.bmiResult,
                          style: const TextStyle(
                              fontSize: 66, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          widget.resultText,
                          style: const TextStyle(fontSize: 32),
                        ),

                      ],
                    ),
                  ),
                ),
                bottomBtn(),
            ],
          ),
        ),
      ),
    );
  }

SizedBox bottomBtn() {
    return SizedBox(
      width: 230,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BmiInput(),
                ));
          },
          child: const Text(
            'คำนวณใหม่',
            style: TextStyle(fontSize: 20),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
            foregroundColor: MaterialStateProperty.all(Colors.purple),
          ),
        ),
      ),
    );
  }
  
}




