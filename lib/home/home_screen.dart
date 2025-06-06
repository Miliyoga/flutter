import 'package:flutter/material.dart';
import 'package:myapp/data/categories_data.dart';
import 'package:myapp/data/restaurant_data.dart';
import 'package:myapp/home/widget/category_widget.dart';
import 'package:myapp/home/widget/restaurant_widget.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/appBar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of<RestaurantData>(context); // Corregido

    return Scaffold(
    
      backgroundColor: const Color.fromRGBO(11, 11, 12, 1),
      drawer: Drawer(),
      appBar: getAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/logo.png', width: 147)),
              Text(
                "Bienvenidos!",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              TextFormField(),
              SizedBox(height: 48),
              Text(
                "Escoja por categoria",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 28.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
    
                  spacing: 8.0,
                  children: List.generate(
                    
                    CategoriesData.listCategories.length,
                    (index) { 
                      return CategoryWidget(
                        category: CategoriesData.listCategories[index],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Image.asset("assets/banners/banner_promo.png"),
              Text("Mejores avalados"),
              Column(
                children: List.generate(
                  restaurantData.listRestaurant.length,
                  (index) {
                    Restaurant restaurant = restaurantData.listRestaurant[index];
                    return RestaurantWidget(restaurant: restaurant);
                  },
                ),
              ),
              SizedBox(height: 64.0), // Coloca este SizedBox correctamente
            ],
          ),
        ),
      ),
    );
  }
}
