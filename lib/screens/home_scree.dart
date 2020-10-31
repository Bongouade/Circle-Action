import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../controllers/action_controller.dart';

import '../models/action_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  double _animBegin;
  double _animEnd;
  final ActionController _controller = ActionController();

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
    _animBegin = 0.0;
    _animEnd = _controller.getRandomPosition();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ActionModel _action = _controller.getAction();
        showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                title: Center(
                  child: Text(
                    "Action!",
                    style: GoogleFonts.bangers(fontSize: 40.0),
                  ),
                ),
                children: [
                  Text(
                    _action.description,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.indieFlower(fontSize: 30.0),
                  ),
                ],
                contentPadding: EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              );
            });
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Circle Action",
            style: GoogleFonts.bangers(fontSize: 70.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Lancer la roue pour obtenir un défi !",
            textAlign: TextAlign.center,
            style: GoogleFonts.bangers(fontSize: 35.0),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                Image.asset("assets/wheel.png"),
                RotationTransition(
                  turns: Tween(begin: _animBegin, end: _animEnd)
                      .animate(_animation),
                  child: GestureDetector(
                    onTap: () {
                      _animationController.forward();
                      if (_animationController.isCompleted) {
                        setState(() {
                          _animBegin = _animEnd - _animEnd.truncate();
                          _animEnd = _controller.getRandomPosition();
                          _animationController.repeat();
                          _animationController.forward();
                        });
                      }
                    },
                    child: Image.asset("assets/arrow.png"),
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
