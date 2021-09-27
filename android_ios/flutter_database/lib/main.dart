import 'package:flutter/material.dart';
import 'package:flutter_database/models/database_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  // const Homepage({Key? key}) : super(key: key);

  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Helper'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _insert();
                },
                child: Text(
                  'Insert',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _query();
                },
                child: Text(
                  'Query',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _update();
                },
                child: Text(
                  'Update',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _delete();
                },
                child: Text(
                  'Delete',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _insert() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: 'Bob',
      DatabaseHelper.columnAge: 20,
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach(print);
  }

  void _update() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnName: 'Mary',
      DatabaseHelper.columnAge: 17,
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s) ');
  }

  void _delete() async {
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }
}
