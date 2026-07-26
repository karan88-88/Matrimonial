import 'package:flutter/material.dart';

class box1 extends StatelessWidget {
  const box1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: Container(
            color: Colors.red,
          )),
          Expanded(child: Column(
            children: [
              Expanded(child: Container(
                color: Colors.green,
              ),flex: 1,),
              Expanded(child: Row(
                children: [
                  Expanded(child: Container(
                    color: Colors.amberAccent,
                  )),
                  Expanded(child: Container(
                    color: Colors.lightBlue,
                  ))
                ],
              ),flex: 2,),
              Expanded(child: Container(
                color: Colors.green,
              ),flex: 3,),

            ],

          )),
          Expanded(child: Container(
            color: Colors.blue,
          ))
        ],
      ),
    );

  }
}
