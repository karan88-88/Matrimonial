import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/Dashboard.dart';
import 'package:new_project/firstscreen.dart';


void main()
{
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}
