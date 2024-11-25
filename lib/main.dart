import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DragBoxScreen(),
    );
  }
}

class DragBoxScreen extends StatefulWidget {
  @override
  _DragBoxScreenState createState() => _DragBoxScreenState();
}

class _DragBoxScreenState extends State<DragBoxScreen> {
  Offset boxPosition = Offset(100, 100); // Initial position of the box

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Box with GestureDetector'),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                // Update box position by adding gesture offset
                boxPosition = Offset(
                  boxPosition.dx + details.delta.dx,
                  boxPosition.dy + details.delta.dy,
                );
              });
            },
            child: Stack(
              children: [
                Positioned(
                  left: boxPosition.dx,
                  top: boxPosition.dy,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
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
