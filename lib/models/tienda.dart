import '../utils/utils.dart';

class Tienda {
  int id;
  String photo;
  String name;
  String location = "San Miguel";
  String type;
  String date = "Hace dos dias";
  String distance = "5.2km ";
  int priceScale; // 1, 2 or 3
  double rating;
  String description =
      "Mejor calidad, mejor precio";

  Tienda(
      this.id, this.photo, this.name, this.type, this.priceScale, this.rating);
}

List<Tienda> Tiendas = [
  Tienda(1, AvailableImages.dell, "Laptop", "Dell", 1, 4.5),
  Tienda(2, AvailableImages.apple, "Notebook", "Apple", 2, 5.0),
  Tienda(3, AvailableImages.hp, "Computadora de Escritorio", "HP", 1, 4.0),
  Tienda(4, AvailableImages.tablet, "Tablet", "Samnsung", 2, 4.5),
];
