import 'package:flutter/material.dart';
import 'views/tienda_details.dart';
import 'views/home.dart';

const String homeViewRoute = '/';
const String tiendaDetailsViewRoute = '/tienda_details';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return MaterialPageRoute(builder: (_) => HomePage());
    case tiendaDetailsViewRoute:
      return MaterialPageRoute(builder: (_) => TiendaDetailsPage(tiendaId: settings.arguments));

      break;
    default:
      return MaterialPageRoute(builder: (_) => HomePage());
  }
}
