import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horta593app/model/product_model.dart';
import 'package:horta593app/screens/home/bloc/product_bloc.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Widget _buildProductCard(Product product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
              ),
              child: Image.network(
                product.imageurl,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Menu"),
          centerTitle: true,
        ),
        body: Center(child:
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state is ProductInitial) {
            return const CircularProgressIndicator(
              color: Colors.amberAccent,
            );
          }
          if (state is ProductLoaded) {
            return Center(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _buildProductCard(Product.getMenu()[index]);
                },
                itemCount: Product.getMenu().length,
              ),
            );
          } else {
            return const Text("Ups! Somethin went wrong!");
          }
        })));
  }
}
