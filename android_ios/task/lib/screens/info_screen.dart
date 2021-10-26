import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/screens/display_screen.dart';

class InfoScreen extends StatefulWidget {
  // const InfoScreen({Key? key}) : super(key: key);
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  TextEditingController ageController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  Future<Null> save(age, gender) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      'age',
      age,
    );
    prefs.setString(
      'gender',
      gender,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Info'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Age',
                  style: TextStyle(fontSize: 28.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter your Age'),
                ),
                Text(
                  'Gender',
                  style: TextStyle(fontSize: 28.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextField(
                  controller: genderController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter your Age'),
                ),
                SizedBox(
                  height: 5.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    save(ageController.text, genderController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayScreen(),
                      ),
                    );
                  },
                  child: Text('SAVE'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
