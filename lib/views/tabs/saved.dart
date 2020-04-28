import 'package:flutter/material.dart';
import 'package:tinder_para_tiendas/widgets/tienda_card.dart';
import '../../models/tienda.dart';

class SavedPage extends StatelessWidget {
  bool isOddNumber(int number) {
    return number % 2 == 0 ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    // final _body = CustomScrollView(
    //   primary: false,
    //   slivers: <Widget>[
    //     SliverPadding(
    //       padding: EdgeInsets.only(
    //         left: 20.0,
    //         right: 20.0,
    //         top: 40.0,
    //         bottom: 40.0,
    //       ),
    //       sliver: SliverGrid.count(
    //         childAspectRatio: 0.6,
    //         crossAxisCount: 2,
    //         mainAxisSpacing: 10.0,
    //         crossAxisSpacing: 10.0,
    //         children: resturants.map(
    //           (resturant) {
    //             int index = resturants.indexOf(resturant);
    //             bool isOddNum = isOddNumber(index);
    //             if (isOddNum) {
    //               return Column(
    //                 children: <Widget>[
    //                   SizedBox(
    //                     height: 50.0,
    //                   ),
    //                   ResturantCard(resturant: resturant)
    //                 ],
    //               );
    //             } else {
    //               return ResturantCard(resturant: resturant);
    //             }
    //           },
    //         ).toList(),
    //       ),
    //     )
    //   ],
    // );

    final _body2 = SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: 40.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              TiendaCard(tienda: Tiendas[0]),
              TiendaCard(tienda: Tiendas[1]),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 70.0,
              ),
              TiendaCard(tienda: Tiendas[2]),
              TiendaCard(tienda: Tiendas[3]),
            ],
          ),
        ],
      ),
    );

    return _body2;
  }

  Widget buildList() {
    List<Tienda> leftSide = [];
    List<Tienda> rightSide = [];
    Tiendas.forEach((tienda) {
      int index = Tiendas.indexOf(tienda);
      bool isOddNum = isOddNumber(index);

      isOddNum ? rightSide.add(tienda) : leftSide.add(tienda);
    });

    return Row(
      children: <Widget>[
        Column(
          children:
              leftSide.map((res) => TiendaCard(tienda: res)).toList(),
        ),
        Column(
          children: rightSide.map((res) {
            return Column(
              children: <Widget>[
                SizedBox(height: 70.0),
                TiendaCard(tienda: res),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
