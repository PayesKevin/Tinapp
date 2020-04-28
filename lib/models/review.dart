import 'tienda.dart';

class Review {
  int id = 0;
  int tiendaId;
  String tiendaPhoto;
  String tiendaName;
  String location = "Aldair";
  String tiendaType;
  String date = "Dos semanas";
  double rating;
  String content;

  Review(this.tiendaId, this.tiendaPhoto, this.tiendaName,
      this.tiendaType, this.rating, this.content);
}

List<Review> reviews = [
  Review(
    Tiendas[0].id,
    Tiendas[0].photo,
    Tiendas[0].name,
    Tiendas[0].type,
    5.0,
    "Lo mejor que he encontrado! Me encanta.",
  ),
  Review(
    Tiendas[0].id,
    Tiendas[1].photo,
    Tiendas[1].name,
    Tiendas[1].type,
    4.9,
    "Creo no he encontrado mejor tienda, con los mejores precios que esta",
  )
];
