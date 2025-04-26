import 'package:flutter/material.dart';
import 'package:learn_with_me/core/constants/app_assets.dart';
import '../routes/app_routes.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';
import '../../core/constants/app_colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        builder: (context, size) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.0, 1.0),
                  stops: [0.0, 1.0],
                  colors: [Color(0xFF366945), Color(0xFF1E3A27)],
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Image.asset(
                        AppAssets.welcomeImage,
                        fit: BoxFit.cover,
                        width: size.width,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Padding(
                             padding: EdgeInsets.only(bottom: size.height*0.02),
                            child: Text(
                              'fun adventure to learn letters',
                              style: TextStyle(
                                  fontSize: size.width * 0.06,
                                  color: const Color(0xFFFFC107),
                                  fontFamily: 'Viga'),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: size.height*0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: size.width*0.03,
                                  height: size.width*0.03,
                                  decoration: const BoxDecoration(
                                    color: Colors.orange,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width*0.03,
                                ),
                                Container(
                                  width: size.width*0.03,
                                  height: size.width*0.03,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: size.height*0.01),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  fixedSize: Size(size.width * 0.8, size.height*0.07)),
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.genderSelection);
                              },
                              child: const Text(
                                'GET START',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                            ),
                          ), 
                                                  
                          
                          Padding(
                            padding:  EdgeInsets.only(bottom: size.height*0.04),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'I ALREADY HAVE AN ACCOUNT',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          );
        }
    );
  }
}
