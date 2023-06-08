import 'package:flutter/material.dart';

class CircleProgress extends StatelessWidget {
  const CircleProgress({super.key});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child : Center(
        child: Container(
          height: 120,
          width: 120,
          decoration : const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                Text(
                    "Loading..",
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ],
          ),
        )
      )
    );
  }
}
