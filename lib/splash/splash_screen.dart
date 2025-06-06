import 'package:flutter/material.dart';
import 'package:myapp/home/home_screen.dart';
import 'package:myapp/ui/_core/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Image.asset('assets/banners/banner_splash.png'),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png', width: 195),
                  const SizedBox(height: 30), // Para simular el spacing
                  Column(
                    children: [
                      Text(
                        "Un amigo innovador para ti",
                        style: TextStyle(color: Colors.white, fontSize: 22.0),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "mejor experiencia gastronómica",
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3338564561.
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      },
                      
                      child: Text("Vamos!", style: TextStyle(color: const Color.fromARGB(255, 9, 8, 8), fontSize: 18.0)),
                
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
