import 'package:flutter/material.dart';
import 'package:myapp/dish/dish.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/appBar.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/${restaurant.imagePath}', width: 100),
            const SizedBox(height: 8), 
            const Text(
              "Los más pedidos",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Column(
              children: List.generate(restaurant.dishes.length, (index) {
                Dish dish = restaurant.dishes[index];
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
                      IconButton(
                        onPressed: () {
                          context.read<BagProvider>().addDish(dish);
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<BagProvider>().removeDish(dish);
                        },
                        icon: const Icon(Icons.remove),
                      ),

                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}


