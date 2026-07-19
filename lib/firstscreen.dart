import 'package:flutter/material.dart';

class Firstscreen extends StatelessWidget {
  const Firstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Scrren"),backgroundColor: Colors.red,foregroundColor: Colors.white,),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(child: Container(
                  color: Colors.blue,
                )),
                Expanded(child: Container(
                  color: Colors.white,
                )),
                Expanded(child: Container(
                  color: Colors.lightBlueAccent,
                )),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(child: Container(
                  color: Colors.lightBlueAccent,
                ),flex: 2,),
                Expanded(child: Container(
                  color: Colors.black54,
                ),flex: 2,),
                Expanded(child: Container(
                  color: Colors.blue,
                )),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(child: Container(
                  color: Colors.blue,
                ),flex: 1,),
                Expanded(child: Container(
                  color: Colors.blueGrey,
                ),flex: 3,),
                Expanded(child: Container(
                  color: Colors.lightBlueAccent,
                ),flex: 2,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
