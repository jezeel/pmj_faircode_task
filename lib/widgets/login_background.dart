import 'package:flutter/material.dart';

SingleChildScrollView loginBackgroundImage() {
  return SingleChildScrollView(
    physics: const NeverScrollableScrollPhysics(),
    child: Container(
      width: 1000,
      height: 1000,
      color: Colors.blueGrey.shade100,
      child: Stack(
        children: [
          Positioned(
            left: 30,
            right: 120,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(38 / 360),
              child: Positioned(
                  child: Container(
                    height: 1000,
                    width: 300,
                    color: Colors.teal.shade900,
                  )),
            ),
          ),
          Positioned(
            left: 99,
            right: 120,
            bottom: 100,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(38 / 360),
              child: Positioned(
                  child: Container(
                    height: 1000,
                    width: 300,
                    color: Colors.teal.shade900,
                  )),
            ),
          ),
          Positioned(
            top: 60,
            right: 280,
            child: CircleAvatar(
              radius: 120.0,
              backgroundColor: Colors.white30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          Positioned(
            left: 100,
            top: 500,
            child: CircleAvatar(
              radius: 200.0,
              backgroundColor: Colors.white30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 320,
            child: CircleAvatar(
              radius: 120.0,
              backgroundColor: Colors.white30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}