import '../../model/product_model.dart';

class MenuGenerator {
  static List<Product> getMenu() {
    return [
      Product(
          id_product: '8001',
          name: "Hamburgesa de Quinoa y Garbanzo",
          description: "Carne de quinoa 3 garbanzos con tomate y pepinos.",
          imageurl:
          "https://2.bp.blogspot.com/-TdgeygGMV08/UwZE_PBicRI/AAAAAAAABtc/hgs8rsgV3Q8/s1600/263.JPG",
          state_product: "disponible",
          price: 4.00),
      Product(
          id_product: '8002',
          name: "Hamburgesa de Lenteja",
          description: "Carne de lenteja, tomate y champinoes.",
          imageurl:
          "https://2.bp.blogspot.com/-TdgeygGMV08/UwZE_PBicRI/AAAAAAAABtc/hgs8rsgV3Q8/s1600/263.JPG",
          state_product: "agotado",
          price: 5.00),
      Product(
          id_product: '8004',
          name: "Combo Hamburguesas",
          description: "Carne de quinoa 3 garbanzos con tomate y pepinos.",
          imageurl:
          "https://2.bp.blogspot.com/-TdgeygGMV08/UwZE_PBicRI/AAAAAAAABtc/hgs8rsgV3Q8/s1600/263.JPG",
          state_product: "disponible",
          price: 7.50),
    ];
  }
}
