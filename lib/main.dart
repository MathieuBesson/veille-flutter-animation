import 'package:flutter/material.dart';

void main() => runApp(AnimationApp());

class AnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animation App'),
        ),
        body: TransitionDemo(),
      ),
    );
  }
}

class TransitionDemo extends StatefulWidget {
  @override
  TransitionDemoState createState() => TransitionDemoState();
}

class TransitionDemoState extends State<TransitionDemo> {
  bool isCircle = true;

  void toggleShape() {
    setState(() {
      isCircle = !isCircle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          toggleShape();
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: isCircle
              ? Container(
                  key: ValueKey<bool>(isCircle),
                  width: 100.0,
                  height: 100.0,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      'Cercle',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : Container(
                  key: ValueKey<bool>(isCircle),
                  width: 100.0,
                  height: 100.0,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                  ),
                  child: const Center(
                    child: Text(
                      'Carré',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
