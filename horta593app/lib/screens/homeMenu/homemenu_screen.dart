import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horta593app/screens/category/category_screen.dart';

import '../../constants/global_variables.dart';
import '../../model/product_model.dart';
import 'bloc/product_bloc.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Widget _buildProductCard(Product product) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SizedBox(
            height: 150,
            child: GestureDetector(
              onTap: () {
                // print("Card!");
              },
              child: Card(
                color: GlobalVariables.darkHorta2,
                // elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 16),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
                      ),
                      child: Image.network(product.imageurl, height: 90),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              product.name,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: GlobalVariables.greenHorta,
                                  fontWeight: FontWeight.bold),
                              maxLines: 3,
                              softWrap: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              product.price.toString(),
                              style: const TextStyle(
                                  color: GlobalVariables.whiteletter),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              product.description,
                              style: const TextStyle(
                                  color: GlobalVariables.whiteletter),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state is ProductInitial) {
        return const CircularProgressIndicator(
          color: Colors.amberAccent,
        );
      }
      if (state is ProductLoaded) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: const [
                      CategoryScreen(title: 'Sandwichs'),
                      CategoryScreen(title: 'Tortillas'),
                      CategoryScreen(title: 'Ensaldas'),
                      CategoryScreen(title: 'Promos'),
                      CategoryScreen(title: 'Bebidas'),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // Add this line to disable inner ListView scrolling
                  itemBuilder: (context, index) {
                    return _buildProductCard(Product.getMenu()[index]);
                  },
                  itemCount: Product.getMenu().length,
                ),
              ],
            ),
          ),
        );
      } else {
        return const Text("Ups! Something went wrong!");
      }
    });
  }
}
