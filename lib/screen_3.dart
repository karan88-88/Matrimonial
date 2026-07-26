import 'package:flutter/material.dart';

class Box3 extends StatelessWidget {
  const Box3({super.key});

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
      body: Column(
        children: [

          // ================= TOP =================
          Expanded(
            flex: 4,
            child: Row(
              children: [

                // Yellow
                box(Colors.yellowAccent, flex: 5),

                // Middle
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      box(Colors.cyan, flex: 1),
                      box(Colors.purple, flex: 1),
                    ],
                  ),
                ),

                // Right
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      box(Colors.indigo),
                      box(Colors.pink),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ================= MIDDLE =================
          Expanded(
            flex: 4,
            child: Row(
              children: [

                // Gray
                box(Colors.grey, flex: 3),

                // Small Boxes
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [

                      // Column 1
                      Expanded(
                        child: Column(
                          children: [
                            box(Colors.cyan, flex: 1),
                            box(Colors.blueGrey, flex: 3),
                            box(Colors.deepOrange, flex: 1),
                          ],
                        ),
                      ),

                      // Column 2
                      Expanded(
                        child: Column(
                          children: [
                            box(Colors.deepPurple, flex: 2),
                            box(Colors.purple, flex: 3),
                            box(Colors.brown, flex: 2),
                          ],
                        ),
                      ),

                      // Column 3
                      Expanded(
                        child: Column(
                          children: [
                            box(Colors.cyanAccent, flex: 2),
                            box(Colors.lightGreen, flex: 2),
                            box(Colors.deepPurple, flex: 3),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Lime
                box(Colors.limeAccent, flex: 3),
              ],
            ),
          ),

          // ================= BOTTOM =================
          Expanded(
            flex: 3,
            child: Row(
              children: [
                box(Colors.red),
                box(Colors.green),
                box(Colors.pinkAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}