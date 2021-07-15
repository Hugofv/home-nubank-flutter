import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ThirdCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/icons/gift-outline.svg',
            color: Colors.grey,
            semanticsLabel: 'gift',
          ),
          Text(
            'Nubank Rewards',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          Text(
            'Acumule pontos que nunca expiram e troque por passagens aéreas ou serviços que você realmente usa',
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.purple, width: 1),
              padding: const EdgeInsets.only(
                left: 70,
                top: 15,
                right: 70,
                bottom: 15,
              ),
            ),
            child: Text('Conheça'),
          )
        ],
      ),
    );
  }
}
