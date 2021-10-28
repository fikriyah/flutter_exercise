import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  dynamic _selectedGender;
  final _snackBar = SnackBar(content: Text('You have submitted!'));
  dynamic _myController1 = TextEditingController();
  final _myController2 = TextEditingController();
  final _myController3 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _myController3.addListener(() {
      setState(() {});
    });
    _myController2.addListener(() {
      setState(() {});
    });
    _myController1.text = '';
    _myController2.text = '';
    _myController1.addListener(() {
      setState(() {}); // setState every time text changes
    });
  }

  @override
  void dispose() {
    _myController1.dispose();
    _myController2.dispose();
    _myController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textField = TextField();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign-Up'),
          backgroundColor: Colors.pink[600],
        ),
        body: ListView(
          padding: const EdgeInsets.all(3.0),
          children: [
            Container(
                padding: EdgeInsets.all(7.0),
                child: Center(
                  child: Text('Welcome To Besquare',
                      style: TextStyle(fontSize: 30)),
                )),
            Container(
                width: 480,
                padding: EdgeInsets.all(10.0),
                child: Center(
                    child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Name'),
                  controller: _myController1,
                ))),
            Container(
                width: 480,
                padding: EdgeInsets.all(10.0),
                child: Center(
                    child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Password'),
                  //controller: _myController2,
                ))),
            Container(
                width: 480,
                padding: EdgeInsets.all(10.0),
                child: Center(
                    child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
            controller: _myController3,
                ))),
            Container(
                padding: const EdgeInsets.only(left: 11.0, right: 10.0),
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all()),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedGender,
                    hint: new Text('Select Gender'),
                    items: <String>['Female', 'Male', 'Rather not to say']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                )),
            Container(
                margin: EdgeInsets.all(6),
                height: 50.0,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                   color: (_myController1.text.isEmpty) && (_myController2.text.isEmpty) || (_myController3.text.isEmpty) ? Colors.grey : Colors.green,
                ),
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                  },
                   
                  child: Text('Submit'),
                ))
          ],
        ));
  }
}
