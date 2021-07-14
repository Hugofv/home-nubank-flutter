import 'package:flutter/material.dart';

class FirstCard extends StatelessWidget {
  const FirstCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Container(color: Colors.grey,),
      ],
    );
  }
}