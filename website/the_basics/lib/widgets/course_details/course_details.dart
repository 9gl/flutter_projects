import 'package:flutter/material.dart';

class CourseDetails extends StatelessWidget {
  // const CourseDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Flutter Web\nTHE BASICS',
            style: TextStyle(
                fontWeight: FontWeight.w800, height: 0.9, fontSize: 80.0),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.',
            style: TextStyle(fontSize: 21, height: 1.7),
          ),
        ],
      ),
    );
  }
}
