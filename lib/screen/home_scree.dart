import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceInOut,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            Image.asset("assets/wheel.png"),
            RotationTransition(
              turns: Tween(begin: 0.0, end: 0.5).animate(_animation),
              child: GestureDetector(
                onTap: () {
                  _animationController.forward();
                  if (_animationController.isCompleted) {
                    _animationController.repeat();
                    _animationController.forward();
                  }
                },
                child: Image.asset("assets/arrow.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
