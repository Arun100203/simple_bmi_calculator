import 'package:flutter/material.dart';

void main(){
  runApp(
      const MaterialApp(
        home: MyApp(),
        debugShowCheckedModeBanner: false,
      ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI_CALCULATOR'),
          backgroundColor: Colors.black,
        ),
        body: const MyHome(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  final TextEditingController _height = TextEditingController();     //get input from text field
  final TextEditingController _weight = TextEditingController();

   double _result = 0.0 ;
   String _bmi = "";
  @override
  Widget build(BuildContext context) {


    void calculateBMI()
    {
      double height = double.parse(_height.text) / 100;
      double weight = double.parse(_weight.text);
      double heightSquare = height * height;

      setState(() {
        double result = weight / heightSquare;       //find bmi value
        _result = result;
        print(result);
        if(result<18.5)                      //checks bmi value
          {
            _bmi = "UnderWeight";
          }
        if(result>18.5 && result<24.9)
        {
          _bmi = "Normal";
        }
        if(result>25.5)
        {
          _bmi = "OverWeight";
        }
      });
    }

    // var result ;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        children:   [
            Container(
              width: double.infinity,
              height: 100.0,
              color: Colors.grey,
              child:  Padding(
                     padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                     child: Column(
                       children:  const [
                          SizedBox(
                            width: double.infinity,
                            child: Text('Body Mass Index',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                           color: Colors.black,
                          decoration: TextDecoration.none,
                          ),
                            ),
                          ),
                       ],
                     ),
              ),
            ),
          Container(
            padding: const EdgeInsets.fromLTRB(30 ,60 ,30 ,30),
            child:   TextField(
                  controller: _height,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width:4 ,color: Colors.black)
                      ),
                  labelText: 'Enter height',labelStyle:TextStyle(color: Colors.black ),
                  hintText: 'Enter Your height in meter'
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30 ,20 ,30 ,30),
            child:   TextField(
              controller: _weight,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width:4 ,color: Colors.black)
                  ),
                  labelText: 'Enter weight',labelStyle:TextStyle(color: Colors.black ),
                  hintText: 'Enter Your weight in kg'
              ),
            ),
          ),
          Container(
            child: MaterialButton(
              color: Colors.black45,
              textColor: Colors.white,
              onPressed: calculateBMI,
              child: const Text("Calculate BMI",style: TextStyle(fontSize: 30),),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.fromLTRB(0 , 0, 20, 0),
              child:  Text(_result == null ? "Enter Values" : "BMI : ${_result.toStringAsFixed(2)}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                ),),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.fromLTRB(0 , 0, 20, 0),
              child:  Text(
               "your weight is : $_bmi",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                ),),
            ),
          ),
        ],
      ),
    );
  }
}


