import 'package:flutter/material.dart';

class Box4 extends StatelessWidget {
  const Box4({super.key});

  // Helper widget: Returns a Container that fills its parent space safely
  Widget colorBox(Color color, {int flex = 1}) {
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
          // ==================== LEFT COLUMN ====================
          Expanded(
            child: Column(
              children: [
                // Section 1: Blue / White / Blue Horizontal Stripes
                Expanded(
                  child: Column(
                    children: [
                      colorBox(Colors.red),
                      colorBox(Colors.white),
                      colorBox(Colors.lightBlue),
                    ],
                  ),
                ),
                // Section 2: Light Green / Purple / Brown Vertical Stripes
                Expanded(
                  child: Row(
                    children: [
                      colorBox(Colors.lightGreen),
                      colorBox(Colors.deepPurple),
                      colorBox(Colors.brown),
                    ],
                  ),
                ),
                // Section 3: Yellow / Black / Orange Horizontal Blocks
                Expanded(
                  child: Column(
                    children: [
                      colorBox(Colors.yellow, flex: 2),
                      colorBox(Colors.black, flex: 1),
                      colorBox(Colors.orange, flex: 1),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ==================== RIGHT COLUMN ====================
          Expanded(
            child: Column(
              children: [
                // Section 1: Blue / Yellow Top Block
                Expanded(
                  child: Row(
                    children: [
                      colorBox(Colors.blue, flex: 2),
                      colorBox(Colors.amber, flex: 1),
                    ],
                  ),
                ),
                // Section 2: Multi-Color Vertical Stripes
                Expanded(
                  child: Row(
                    children: [
                      colorBox(Colors.deepOrange),
                      colorBox(Colors.lime),
                      colorBox(Colors.purpleAccent),
                      colorBox(Colors.orange),
                      colorBox(Colors.blue),
                    ],
                  ),
                ),
                // Section 3: Horizontal Bars
                Expanded(
                  child: Column(
                    children: [
                      colorBox(Colors.grey),
                      colorBox(Colors.cyan),
                      colorBox(Colors.pinkAccent),
                    ],
                  ),
                ),
                // Section 4: Bottom Grid/Stripes
                Expanded(
                  child: Row(
                    children: [
                      colorBox(Colors.tealAccent, flex: 2),
                      colorBox(Colors.cyanAccent, flex: 1),
                      colorBox(Colors.limeAccent, flex: 1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}