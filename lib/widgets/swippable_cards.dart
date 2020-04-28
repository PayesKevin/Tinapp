import 'package:flutter/material.dart';
import '../utils/utils.dart';
import '../widgets/tienda_card_big.dart';
import '../models/tienda.dart';

class SwippableCards extends StatefulWidget {
  @override
  _SwippableCardsState createState() => _SwippableCardsState();
}

class _SwippableCardsState extends State<SwippableCards> {
  List<Widget> cardList;
  List<Tienda> _tiendasCopy = List.from(Tiendas.reversed);

  void _removeCard(index) {
    setState(() {
      // Get a copy of item to be removed
      Tienda r = _tiendasCopy[index];

      // Remove Card from List
      cardList.removeAt(index);

      // Remove Item from List
      _tiendasCopy.removeAt(index);

      // Insert item back into the list so we have a continous stream of data
      _tiendasCopy.insert(0, r);

      // Rebuild the card list with the new data
      cardList = _getSwipeCards();
    });
  }

  @override
  void initState() {
    super.initState();

    cardList = _getSwipeCards();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: cardList,
      ),
    );
  }

  List<Widget> _getSwipeCards() {
    double initTop = 15.0;
    double initHor = 20.0;
    double initWidth = 0.9;
    List<Widget> cardList = new List();

    for (var i = 0; i < _tiendasCopy.length; i++) {
      // var width = initWidth - double.parse("0.$i");
      var width;
      if (i == _tiendasCopy.length) {
        width = 0.9;
      } else if (i == _tiendasCopy.length - 1) {
        width = initWidth - 0.05;
      } else if (i == _tiendasCopy.length - 2) {
        width = initWidth - 0.1;
      } else if (i == _tiendasCopy.length - 3) {
        width = initWidth - 0.15;
      } else {
        width = initWidth - 0.2;
      }
      cardList.add(
        Positioned(
          top: initTop * (i + 1),
          child: Draggable(
            feedback: Material(
              borderRadius: BorderRadius.circular(20.0),
              child: TiendaCardBig(tienda: _tiendasCopy[i]),
            ),
            childWhenDragging: Container(),
            onDragEnd: (drag) {
              _removeCard(i);
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: initHor - (3 * (i + 1)),
                vertical: 10.0,
              ),
              child: TiendaCardBig(
                tienda: _tiendasCopy[i],
                width: width,
              ),
            ),
            data: _tiendasCopy[i],
          ),
        ),
      );
    }

    final footerBtns = Positioned(
      bottom: 20.0,
      left: 10.0,
      right: 10.0,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildCircularBtn(40.0, AvailableImages.back, 1),
            _buildCircularBtn(70.0, AvailableImages.hate, 2),
            _buildCircularBtn(70.0, AvailableImages.like, 3),
            _buildCircularBtn(40.0, AvailableImages.list, 4),
          ],
        ),
      ),
    );

    cardList.add(footerBtns);

    return cardList;
  }

  Widget _buildCircularBtn(double height, String img, int type) {
    double imageSize;

    if (type == 1 || type == 4) {
      imageSize = 25.0;
    } else {
      imageSize = 35.0;
    }

    return MaterialButton(
      color: Colors.white,
      elevation: 4.0,
      onPressed: () {},
      height: height,
      shape: CircleBorder(),
      child: Container(
        height: 40.0,
        child: Image.asset(
          img,
          height: imageSize,
          width: imageSize,
        ),
      ),
    );
  }
}
