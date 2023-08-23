import 'package:flutter/material.dart';
import 'package:tempconvert/conversion.dart';
import 'package:get/get.dart';

int vart=0;
void main() {
  runApp(const MyApp());
}
Conversion calculate=Conversion();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(vart++);
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TempConvert(),
    );
  }
}

class TempConvert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1D1E33),
        appBar: AppBar(
          title: const Text('Temperature Converter',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.lightBlue,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: TempPage(),
          ),
        ));
  }
}

class TempPage extends StatefulWidget {
  @override
  _TempPageState createState() => _TempPageState();
}

double inputC=0.0;
RxString outputC='Input the value in Celsius'.obs;
double inputK=0.0;
RxString outputK='Input the value in Kelvin'.obs;
double inputF=0.0;
RxString outputF='Input the value in Fahrenhiet'.obs;
int value=0;

class _TempPageState extends State<TempPage> {
  FocusNode myfocus = FocusNode();

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 15.0, right: 10.0),
      child:SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.limeAccent,
                  child: Text(
                    'Celsius',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width:10.0),
                SizedBox(width: 220, height: 60, child: Obx(()=>TextField(
                  style: const TextStyle(color:Colors.white,fontSize: 20.0),
                  keyboardType: TextInputType.number,
                  onChanged: (str) {
                    try {
                      inputC = double.parse(str);
                      value=1;
                      calculate.handleTemp();
                    } catch (e) {
                      inputC = 0.0;
                    }
                  },
                  decoration:  InputDecoration(
                      labelText: outputC.value,
                      labelStyle: TextStyle(color:Colors.white,fontSize: 18.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.limeAccent))),
                ),),),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.deepOrangeAccent,
                  child: Text(
                    'Fahrenhiet',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width:10.0),
                SizedBox(width: 220, height: 60, child: Obx(()=>TextField(
                  style: const TextStyle(color:Colors.white),
                  keyboardType: TextInputType.number,
                  onChanged: (str) {
                    try {
                      inputF = double.parse(str);
                      value=2;
                      calculate.handleTemp();
                    } catch (e) {
                      inputF = 0.0;
                    }
                  },
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color:Colors.white,fontSize: 18.0),
                      labelText: outputF.value,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 3, color: Colors.deepOrangeAccent))),)

                ),),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.red,
                  child: Text(
                    'Kelvin',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width:10.0),
                SizedBox(width: 220, height: 60, child: Obx(()=>TextField(
                  style: const TextStyle(color:Colors.white),
                  keyboardType: TextInputType.number,
                  onChanged: (str) {
                    try {
                      inputK = double.parse(str);
                      value=3;
                      calculate.handleTemp();

                    } catch (e) {
                      inputK = 0.0;
                    }
                  },
                  decoration:  InputDecoration(
                      labelStyle: TextStyle(color:Colors.white,fontSize: 18.0),
                      labelText: outputK.value,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red))),
                ),),),
              ],
            ),
            const SizedBox(
              height:60.0
            ),
            TextButton(
              style:ButtonStyle(

                backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),

                  ),),),
              onPressed: () {
              outputC.value='Input the value in Celsius';
              outputK.value='Input the value in Kelvin';
              outputF.value='Input the value in Fahrenhiet';

              Navigator.pop(context);
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>  TempConvert(),
                ),
              );

              },
              child: const Text('Refresh',style:TextStyle(fontSize: 20.0,color: Colors.white)),
            )

          ],
        ),
      ),
    );
  }
}
