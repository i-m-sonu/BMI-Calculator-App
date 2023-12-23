import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wt = TextEditingController();
  var ft = TextEditingController();
  var inc = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: wt,
                  decoration: InputDecoration(
                      label: Text("Enter your Weight"),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ft,
                  decoration: InputDecoration(
                      label: Text("Enter your Height(in feet)"),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inc,
                  decoration: InputDecoration(
                      label: Text("Enter your Height(in inches)"),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wtt = wt.text.toString();
                      var ftt = ft.text.toString();
                      var inct = inc.text.toString();
                      if (wtt != "" && ftt != "") {
                        setState(() {
                          var iwt = int.parse(wtt);
                          var ift = int.parse(ftt);
                          var i = int.parse(inct);
                          var ti = (ift * 12) + i;
                          var tc = ti * 2.54;
                          var t = tc / 100;
                          var bmi = iwt / (t + t);
                          result = "BMI is $bmi";
                        });
                      } else {
                        setState(() {
                          result = "Fill it up properly";
                        });
                      }
                    },
                    child: Text("Calculate")),
                Text(
                  result,
                  style: TextStyle(fontSize: 19),
                ),
              ],
            ),
          ),
        ));
  }
}
