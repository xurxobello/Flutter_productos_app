import 'package:flutter/material.dart';
import 'package:flutter_validacion_formularios/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Productos'),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'product'),
                  child: ProductCard(),
                )),
        floatingActionButton:
            FloatingActionButton(child: Icon(Icons.add), onPressed: () {}));
  }
}
