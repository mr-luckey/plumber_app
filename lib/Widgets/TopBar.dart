import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
        // color: Colors.red,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.arrow_back),
          Row(
            children: [
              Text('Skip'),
              Icon(Icons.arrow_forward_ios_outlined),
            ],
          )
        ],
      ),
    );
  }
}

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 55,
        decoration: const BoxDecoration(
          color: Colors.white,
          // color: Colors.red,
        ),
        child: const Padding(
          padding: EdgeInsets.all(18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back),
              Text('Plumber App'),
              Row(
                children: [
                  Text('Skip'),
                  Icon(Icons.arrow_forward_ios_outlined),
                ],
              )
            ],
          ),
        ));
  }
}

class OnlyTitle extends StatelessWidget {
  const OnlyTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 55,
        decoration: const BoxDecoration(
          color: Colors.white,
          // color: Colors.red,
        ),
        child: const Padding(
          padding: EdgeInsets.all(18),
          child: Row(
            children: [
              Icon(Icons.arrow_back),
              SizedBox(width: 90),
              Text('Plumber App'),
            ],
          ),
        ));
  }
}
