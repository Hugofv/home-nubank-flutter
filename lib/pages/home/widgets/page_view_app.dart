import 'package:flutter/material.dart';
import 'package:teste/pages/home/widgets/card_app.dart';
import 'package:teste/pages/home/widgets/first_card.dart';

class PageViewApp extends StatelessWidget {
  final double top;
  final ValueChanged<int> onChanged;
  final GestureDragUpdateCallback onPanUpdate;
  final bool showMenu;

  const PageViewApp(
      {Key? key,
      required this.top,
      required this.onChanged,
      required this.onPanUpdate,
      required this.showMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 250),
      curve: Curves.easeOut,
      top: top,
      height: MediaQuery.of(context).size.height * .45,
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onPanUpdate: onPanUpdate,
        child: PageView(
          onPageChanged: onChanged,
          physics: showMenu
              ? NeverScrollableScrollPhysics()
              : BouncingScrollPhysics(),
          children: [
            CardApp(
              child: FirstCard(),
            ),
            CardApp(
              child: FirstCard(),
            ),
            CardApp(
              child: FirstCard(),
            ),
          ],
        ),
      ),
    );
  }
}
