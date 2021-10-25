import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xolophone125/views/soundTile.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.green,
    Colors.teal,
    Colors.yellow
  ];
  List<int> soundNumbers = [1, 2, 3, 4, 5, 6, 7];
  var selectedColor; // Option 2
  int selNo; // Option 2

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text("Please chose a color and number to continue"),
              DropdownButton(
                hint:
                    Text('Please choose a Color'), // Not necessary for Option 1
                value: selectedColor,
                onChanged: (newValue) {
                  setState(() {
                    selectedColor = newValue;
                  });
                },
                items: colors.map((location) {
                  return DropdownMenuItem(
                    child: new Container(
                      height: 50,
                      width: 50,
                      color: location,
                    ),
                    value: location,
                  );
                }).toList(),
              ),
              DropdownButton(
                hint: Text(
                    'Please choose a Sound number'), // Not necessary for Option 1
                value: selNo,
                onChanged: (newValue) {
                  setState(() {
                    selNo = newValue;
                  });
                },
                items: soundNumbers.map((location) {
                  return DropdownMenuItem(
                    child: new Container(
                      child: Text("$location"),
                    ),
                    value: location,
                  );
                }).toList(),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (selectedColor != null && selNo != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SoundView(
                                    color: selectedColor,
                                    number: selNo,
                                  )));
                    }
                  },
                  child: Text("Continue"))
            ],
          ),
        ),
      ),
    );
  }
}
