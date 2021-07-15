import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecondCard extends StatefulWidget {
  const SecondCard({Key? key}) : super(key: key);

  @override
  _SecondCardState createState() => _SecondCardState();
}

class _SecondCardState extends State<SecondCard>
    with AutomaticKeepAliveClientMixin {
  bool _showBalance = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.attach_money_sharp,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Conta',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showBalance = !_showBalance;
                                  });
                                },
                                child: SvgPicture.asset(
                                  !_showBalance
                                      ? 'assets/icons/eye-off-outline.svg'
                                      : 'assets/icons/eye-outline.svg',
                                  color: Colors.grey,
                                  semanticsLabel: 'Eye Outline',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, bottom: 20),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Saldo disponível',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                                _showBalance
                                    ? Text.rich(
                                        TextSpan(text: 'R\$ 150.877,34'),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 28,
                                        ),
                                      )
                                    : Container(
                                        height: 32,
                                        width: 160,
                                        color: Colors.grey[300],
                                      ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Expanded(flex: 3, child: Container(color: Colors.orange)),
                      Expanded(flex: 1, child: Container(color: Colors.blue)),
                      Expanded(flex: 2, child: Container(color: Colors.green)),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.credit_card,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        'Compra mais recente em SuperMercado R\$ 212,76 sexta',
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.grey[400],
                      size: 18,
                    )
                  ],
                ),
              ),
              color: Colors.grey[200],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
