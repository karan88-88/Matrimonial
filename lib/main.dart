import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/Dashboard.dart';
import 'package:new_project/demoform.dart';
import 'package:new_project/firstscreen.dart';
import 'package:new_project/registrationform.dart';
import 'package:new_project/screen_1.dart';
import 'package:new_project/screen_2.dart';
import 'package:new_project/screen_3.dart';
import 'package:new_project/screen_4.dart';
import 'package:new_project/scrren_5.dart';

import 'demoform2.dart';


void main()
{
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SignUp(),
    );
  }
}
