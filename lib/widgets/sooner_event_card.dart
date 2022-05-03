import 'package:flutter/material.dart';

class SoonerEventCard extends StatelessWidget {
  const SoonerEventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 120,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          elevation: 5.0,
          child: Stack(
            children: [
              const FlutterLogo(),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      "10",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
