import 'package:flutter/material.dart';
import 'package:teste/pages/home/widgets/item_menu_bottom.dart';
import 'package:teste/pages/home/widgets/menu_app.dart';
import 'package:teste/pages/home/widgets/my_app_bar.dart';
import 'package:teste/pages/home/widgets/my_dots_app.dart';
import 'package:teste/pages/home/widgets/page_view_app.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu = false;
  int _currentIndex = 0;
  double _yPosition = 0;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    if (_yPosition == 0) {
      _yPosition = _screenHeight * .20;
    }

    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          MyAppBar(
            showMenu: _showMenu,
            onTap: () {
              setState(() {
                _showMenu = !_showMenu;
                _yPosition =
                    _showMenu ? _screenHeight * .75 : _screenHeight * .20;
              });
            },
          ),
          MenuApp(
            top: _screenHeight * .20,
            showMenu: _showMenu,
          ),
          PageViewApp(
            top: _yPosition,
            showMenu: _showMenu,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdate: (detail) {
              double positionBottomLimit = _screenHeight * .75;
              double positionTopLimit = _screenHeight * .20;
              double halfPosition = positionBottomLimit - positionTopLimit;
              halfPosition = halfPosition / 2;

              setState(() {
                _yPosition += detail.delta.dy;

                _yPosition = _yPosition < positionTopLimit
                    ? positionTopLimit
                    : _yPosition;

                _yPosition = _yPosition > positionBottomLimit
                    ? positionBottomLimit
                    : _yPosition;

                if (_yPosition != positionBottomLimit && detail.delta.dy > 0) {
                  _yPosition = _yPosition > positionTopLimit + halfPosition - 70
                      ? positionBottomLimit
                      : _yPosition;
                }

                if (_yPosition != positionTopLimit && detail.delta.dy < 0) {
                  _yPosition = _yPosition < positionBottomLimit - halfPosition
                      ? positionTopLimit
                      : _yPosition;
                }

                if (_yPosition == positionBottomLimit) {
                  _showMenu = true;
                } else if (_yPosition == positionTopLimit) {
                  _showMenu = false;
                }
              });
            },
          ),
          MyDotsApp(
            top: _screenHeight * .70,
            currentIndex: _currentIndex,
            showMenu: _showMenu,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            bottom: !_showMenu ? 0 + MediaQuery.of(context).padding.bottom : 0,
            left: 0,
            right: 0,
            height: _screenHeight * .12,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: !_showMenu ? 1 : 0,
              child: Container(
                height: 150,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    ItemMenuBottom(
                      icon: Icons.person_add,
                      text: 'Indicar amigos',
                    ),
                    ItemMenuBottom(
                      icon: Icons.phone,
                      text: 'Recarga de celular',
                    ),
                    ItemMenuBottom(
                      icon: Icons.chat,
                      text: 'Cobrar',
                    ),
                    ItemMenuBottom(
                      icon: Icons.monetization_on,
                      text: 'Empréstimos',
                    ),
                    ItemMenuBottom(
                      icon: Icons.move_to_inbox,
                      text: 'Depositar',
                    ),
                    ItemMenuBottom(
                      icon: Icons.mobile_screen_share,
                      text: 'Transferir',
                    ),
                    ItemMenuBottom(
                      icon: Icons.format_align_center,
                      text: 'Ajustar limite',
                    ),
                    ItemMenuBottom(
                      icon: Icons.chrome_reader_mode,
                      text: 'Pagar',
                    ),
                    ItemMenuBottom(
                      icon: Icons.lock_open,
                      text: 'Bloquear cartão',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
