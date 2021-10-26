import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayScreen extends StatefulWidget {
  // const DisplayScreen({ Key? key }) : super(key: key);

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  String _age, _gender;

  @override
  void initState() {
    super.initState();
    data();
  }

  void data() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String age = prefs.getString('age');
    final String gender = prefs.getString('gender');
    setState(() {
      _age = age;
      _gender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User info'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Age:' + _age,
                  style: TextStyle(fontSize: 24.0),
                ),
                Text(
                  'Gender:' + _gender,
                  style: TextStyle(fontSize: 24.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
