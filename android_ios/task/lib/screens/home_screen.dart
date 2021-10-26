import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/models/users_info.dart';
import 'package:task/screens/display_screen.dart';
import 'package:task/screens/info_screen.dart';
import 'package:task/services/api_manager.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoggedIn = false;

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('username');
    if (userId != null) {
      setState(() {
        isLoggedIn = true;
      });
      return;
    }
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', null);

    setState(() {
      isLoggedIn = false;
    });
  }

  Future<Null> loginUser(user_name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      'username',
      user_name,
    );

    setState(() {
      isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        foregroundColor: Colors.blue[50],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<List<GetUsers>>(
          future: Api_Manager().fetchJSONData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return ListView(
              children: snapshot.data
                  .map(
                    (user) => ListTile(
                      title: Text(
                        user.id + " " + user.name,
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onTap: () {
                        isLoggedIn ? autoLogIn() : loginUser(user.name);
                        isLoggedIn
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DisplayScreen()))
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InfoScreen()));
                      },
                      subtitle: Text(user.atype),
                      trailing: TextButton(
                        onPressed: () {
                          logout();
                        },
                        child: isLoggedIn
                            ? Text(
                                'Sign In',
                                style: TextStyle(color: Colors.green[400]),
                              )
                            : Text(
                                'Sign Out',
                                style: TextStyle(color: Colors.red[400]),
                              ),
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
