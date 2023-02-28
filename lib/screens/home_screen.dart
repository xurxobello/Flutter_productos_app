import 'package:flutter/material.dart';
import 'package:flutter_validacion_formularios/models/models.dart';
import 'package:flutter_validacion_formularios/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:flutter_validacion_formularios/services/services.dart';
import 'package:flutter_validacion_formularios/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductService>(context);

    if (productsService.isLoading) return LoadingScreen();

    return Scaffold(
        appBar: AppBar(
          title: Text('Productos'),
        ),
        body: ListView.builder(
            itemCount: productsService.products.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
                  onTap: () {
                    productsService.selectedProduct =
                        productsService.products[index].copy();
                    Navigator.pushNamed(context, 'product');
                  },
                  child: ProductCard(
                    product: productsService.products[index],
                  ),
                )),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              productsService.selectedProduct =
                  new Product(available: false, name: '', price: 0);
              Navigator.pushNamed(context, 'product');
            }));
  }
}
