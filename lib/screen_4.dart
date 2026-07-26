import 'package:flutter/material.dart';

class box4 extends StatelessWidget {
  const box4({super.key});

  Widget box(Color color, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: const EdgeInsets.all(1),
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(

        children: [
          Expanded(
            child: Column(
              //first cloumn
              children: [
                Expanded(child: Column(
                  children: [
                    box(Colors.blue),
                    box(Colors.white),
                    box(Colors.blueAccent),
                  ],
                )),
                Expanded(child: Row(
                  children: [
                    box(Colors.red),
                    box(Colors.white),
                    box(Colors.blue),
                  ],
                )),
                Expanded(child: Column(
                  children: [
                    box(Colors.deepOrange,flex: 4),
                    box(Colors.white,flex: 2),
                    box(Colors.green,flex: 3),
                  ],
                )),

              ],
            ),
          ),
          //second column
          Expanded(
            child: Column(
              children: [
                Expanded(child: Row(
                  children: [
                    box(Colors.deepOrange,flex: 2),
                    box(Colors.white),
                    box(Colors.green,flex: 2),
                  ],
                )),
                Expanded(child: Row(
                  children: [
                    box(Colors.deepOrange,flex: 2),
                    box(Colors.green,flex: 2),
                    box(Colors.blue,flex: 3),
                    box(Colors.red),
                    box(Colors.white),
                  ],
                )),
                Expanded(child: Column(
                  children: [
                    box(Colors.grey,flex: 2),
                    box(Colors.white,flex: 2),
                    box(Colors.black,flex: 4),
                  ],
                )),
                Expanded(child: Row(
                  children: [
                    box(Colors.deepOrange,flex: 4),
                    box(Colors.white,flex: 2),
                    box(Colors.green,flex: 2),
                  ],
                )),
                Expanded(child: Row(
                  children: [
                    box(Colors.red),
                    box(Colors.white),
                    box(Colors.blue),
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
