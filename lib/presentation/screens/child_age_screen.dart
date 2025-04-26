import 'package:flutter/material.dart';
import 'package:learn_with_me/core/constants/app_assets.dart';
import 'package:learn_with_me/core/constants/app_colors.dart';
import 'package:learn_with_me/core/utils/extensions/size_extention.dart';
import 'package:get_it/get_it.dart';
import '../routes/app_routes.dart';

class ChildAgeScreen extends StatefulWidget {
  const ChildAgeScreen({super.key});

  @override
  State<ChildAgeScreen> createState() => _ChildAgeScreenState();
}

class _ChildAgeScreenState extends State<ChildAgeScreen> {
  String _selectedAge = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (BuildContext context, size) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.childAgeBackgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05, right: size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.05, left: size.width * 0.04),
                      
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize:
                                  Size(size.width * 0.2, size.height * 0.05),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                           
                                Navigator.of(context).pop();
                           
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Viga'),
                          ),
                        ),
                      ],
                    ),
                  ),
                   Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: size.height * 0.35),
                      child: Text(
                        "What age is your child ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.orange,
                          fontSize: size.width * 0.07,
                          fontFamily: "Viga",
                        ),
                      ),
                    ),
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Padding(
                            padding: EdgeInsets.only(bottom: size.height * 0.02),
                            child: ElevatedButton(
                                onPressed: () => _selectAgeAndNavigate("4-5"),
                                style: ageButtonStyle(size),
                                child: const Text("4 - 5 years",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Viga"))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: size.height * 0.02),
                            child: ElevatedButton(
                                onPressed: () => _selectAgeAndNavigate("6-7"),
                                style: ageButtonStyle(size),
                                child: const Text("6 - 7 years",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Viga"))),
                          ),
                         Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.02),
                          child: ElevatedButton(
                              onPressed: () => _goToIntroductionScreen("7-8"),
                              style: ageButtonStyle(size),
                              child: const Text("7 - 8 years",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Viga"))),
                          ),
                           Padding(
                            padding:  EdgeInsets.only(top: size.height*0.05),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(size.width,size.height *0.07),
                                  backgroundColor: Colors.white
                                ),
                                onPressed: () {
                                  if(_formKey.currentState!.validate()){
                                  if(_selectedAge !=""){
                                     GetIt.I.registerSingleton<String>(_selectedAge, instanceName: 'childAge');
                                    Navigator.pushNamed(context, AppRoutes.introduction);
                                  }
                                  }
                                },
                                child: const Text("Next",style: TextStyle(color: Colors.black,fontFamily: "Viga"),)),
                          )
                        ],
                      )),
                  
                ]),
              )),
      );
    });
  }

  ButtonStyle ageButtonStyle(size) {
    return ElevatedButton.styleFrom(
      fixedSize: Size(size.width, size.height * 0.07),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
   void _selectAgeAndNavigate(String age) {
    setState(() {
      _selectedAge = age;
    });
    
    
  }

}

