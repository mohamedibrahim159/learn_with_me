import 'package:flutter/material.dart';
import 'package:learn_with_me/core/constants/app_colors.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (BuildContext context, size) {
      return Scaffold(
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.05, right: size.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TestimonialWidget(
                  text: 
                      "A blessing for those parents who are at pains to make up their kid's screen-time. weeks my minor is in the app, and we keep counting.",
                  userName: "Foad yasser",
                  firstLetter: "F",
                  color: AppColors.green,
                ),
                SizedBox(height: size.height * 0.02),
                const TestimonialWidget(
                  text: 
                      "My picky daughter really enjoys the app, and i find the content and the overall feel it gives just amazing.",
                  userName: "Elrefaay",
                  firstLetter: "E",
                  color: AppColors.purple,
                ),
                SizedBox(height: size.height * 0.02),
                const TestimonialWidget(
                  text: 
                      "pushes logic and memory up. puzzles vary in difficulty, and that adapts to your kid's learning pace. perfect !",
                  userName: "hemdan",
                  firstLetter: "H",
                  color: AppColors.blue,
                ),
                SizedBox(height: size.height * 0.02),
                const TestimonialWidget(
                  text: 
                      "the best app I've seen so far. tons of fascinating puzzles. but the main thing is that kids do learn with it !",
                  userName: "Mohamed",
                  firstLetter: "M",
                  color: AppColors.orange,
                ),
                SizedBox(height: size.height * 0.05),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.home);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                      fixedSize: Size(size.width, size.height * 0.07)),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                        fontFamily: "Viga", color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class TestimonialWidget extends StatelessWidget {
  const TestimonialWidget(
      {super.key,
      required this.text,
      required this.userName,
      required this.firstLetter,
      required this.color});

  final String text;
  final String userName;
  final String firstLetter;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (BuildContext context, size) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(size.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(    
            text,
          ),
          SizedBox(height: size.height * 0.02),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: Text(
                  firstLetter,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(width: size.width * 0.02),
               Text(userName),
            ],
          ),
        ],
      ),
    );
  });
  }
}