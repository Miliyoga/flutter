import 'package:flutter/material.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:provider/provider.dart';
import 'package:myapp/dish/dish.dart'; // Asegúrate de importar Dish si no lo has hecho

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
        actions: [
          TextButton(
            onPressed: () {
              bagProvider.clearBag();
            },
            child: const Text('limpiar'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Pedidos", textAlign: TextAlign.center),
              Column(
                children: List.generate(
                  bagProvider.getMapByAccount().keys.length,
                  (index) {
                    Dish dish = bagProvider.getMapByAccount().keys.toList()[index];
                    return ListTile(
                      onTap: () {},
                      leading: Image.asset(
                        'assets/dishes/default.png',
                        width: 48,
                        height: 48,
                      ),
                      title: Text(dish.name),
                      subtitle: Text("R\$${dish.price.toStringAsFixed(2)}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        IconButton(onPressed: () {
                          bagProvider.removeDish(dish);
                        },
                        icon: Icon(Icons.remove)),
                        Text(bagProvider.getMapByAccount()[dish].toString(), style: TextStyle(fontSize: 18.0),
                        ), 
                        IconButton(onPressed: () {
                          bagProvider.addDish(dish);
                        }, icon: Icon(Icons.add)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
