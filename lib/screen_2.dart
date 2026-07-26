import 'package:flutter/material.dart';

class box2 extends StatelessWidget {
  const box2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          //first part
          Expanded(child: Row(
            children: [
              Expanded(child: Container(
                color: Colors.amberAccent,
              ),flex: 2,),
              Expanded(child: Column(
                children: [
                  Expanded(child: Container(
                    color: Colors.blue,
                  )),
                  Expanded(child: Container(
                    color: Colors.green,
                  )),
                ],
              )),
              Expanded(child: Column(
                children: [
                  Expanded(child: Container(
                    color: Colors.blueGrey,
                  )),
                  Expanded(child: Container(
                    color: Colors.red,
                  ))
                ],
              ))
            ],
          ),flex: 1,),
          //second part
          Expanded(child: Row(
            children: [
              Expanded(child: Container(
                color: Colors.blueGrey,
              ),flex: 2,),
              Expanded(child: Column(
                //first column
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.red,
                  ),flex: 2,),
                  Expanded(child: Container(
                    color: Colors.yellow,
                  ),flex: 3,),
                  Expanded(child: Container(
                    color: Colors.green,
                  ),flex: 1,),
                ],
              )),
              Expanded(child: Column(
                //Second  column
                children: [
                  Expanded(child: Container(
                    color: Colors.blue,
                  )),
                  Expanded(child: Container(
                    color: Colors.white,
                  )),
                  Expanded(child: Container(
                    color: Colors.black,
                  )),
                ],
              )),
              Expanded(child: Column(
                //third column
                children: [
                  Expanded(child: Container(
                    color: Colors.red,
                  ),flex: 2,),
                  Expanded(child: Container(
                    color: Colors.yellow,
                  )),
                  Expanded(child: Container(
                    color: Colors.green,
                  ),flex: 2,),
                ],
              )),
              Expanded(child: Container(
                color: Colors.deepOrangeAccent,
              ),flex: 2,)
            ],
          ),flex: 3,),
          //third part
          Expanded(child: Row(
            children: [
              Expanded(child: Container(
                color: Colors.red,
              ),flex: 1,),
              Expanded(child: Container(
                color: Colors.green,
              ),flex: 1,),
              Expanded(child: Container(
                color: Colors.blue,
              ),flex: 1,),
            ],
          ),flex: 2,)
        ],
      ),
    );
  }
}
