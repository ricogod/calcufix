import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double result = 0;
  double kedua = 0;
  double pertama = 0;
  void _tambah() {
    setState(() {
      result = pertama + kedua;
    });
  }

  void _kurang() {
    setState(() {
      result = pertama - kedua;
    });
  }

  void _kali() {
    setState(() {
      result = pertama * kedua;
    });
  }

  void _bagi() {
    setState(() {
      result = pertama / kedua;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) {
                  try {
                    pertama = double.parse(value);
                  } catch (e) {
                    pertama = 0;
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter first number',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  try {
                    kedua = double.parse(value);
                  } catch (e) {
                    kedua = 0;
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter second number',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('+'),
                  Radio(
                      value: '+',
                      groupValue: result,
                      onChanged: (value) {
                        setState(() {
                          _tambah();
                        });
                      }),
                  Text('-'),
                  Radio(
                      value: '-',
                      groupValue: result,
                      onChanged: (value) {
                        setState(() {
                          _kurang();
                        });
                      }),
                  Text('*'),
                  Radio(
                      value: '*',
                      groupValue: result,
                      onChanged: (value) {
                        setState(() {
                          _kali();
                        });
                      }),
                  Text('/'),
                  Radio(
                      value: '/',
                      groupValue: result,
                      onChanged: (value) {
                        setState(() {
                          _bagi();
                        });
                      }),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text('Result: ' '$result'),
            ],
          ),
        ),
      ),
    );
  }
}
