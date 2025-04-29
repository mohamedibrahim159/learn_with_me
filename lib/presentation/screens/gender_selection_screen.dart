--- a/lib/presentation/screens/gender_selection_screen.dart
+++ b/lib/presentation/screens/gender_selection_screen.dart
import 'package:flutter/material.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';
import 'package:learn_with_me/core/constants/app_assets.dart';
import 'package:learn_with_me/core/constants/app_colors.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? selectedGender;
  final TextEditingController _nameController = TextEditingController();

  void _selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _preferNotAnswer = false;
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (BuildContext context, size) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.only(
              left: size.width * 0.05, right: size.width * 0.05),
          child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(



                        padding: EdgeInsets.only(top: size.height * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  fixedSize:
                                      Size(size.width * 0.2, size.height * 0.05),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20))),
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.login);
                              },
                              child: const Text(
                                'Back',
                                style: TextStyle(

                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: 'Viga'),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  fixedSize: Size(size.width * 0.2, size.height * 0.05),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20))),
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.welcome);
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
                      Padding(
                         padding: EdgeInsets.only(top: size.height * 0.08),
                        child: const Text(
                          const "What are your kid's gender and name ?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.05,
                              fontFamily: "Viga",
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () => _selectGender('boy'),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                         AssetImage(AppAssets.boyImage),
                                    radius: size.width * 0.18,
                                    backgroundColor: Colors.transparent,
                                   ),
                                 const Text(
                                    "Boy",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.width * 0.05),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _selectGender('girl'),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                         AssetImage(AppAssets.girlImage),
                                    radius: size.width * 0.18,
                                    backgroundColor: AppColors.transparent,
                                  ),
                                  const Text(
                                    "Girl",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.width * 0.05),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.05),
                        child: Container(
                          
                           decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            controller: _nameController,
                            decoration:  InputDecoration(

                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Name of kid',
                                 border: InputBorder.none,),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the kid\'s name';
                                    }
                                  return null;
                                  },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Switch(
                            value: _preferNotAnswer,
                            onChanged: (value) {
                              setState(() {
                                _preferNotAnswer = value;
                              });
                            },
                            activeColor: Colors.white,
                          ),
                            const Text(
                              "prefer not answer",
                              style:
                                  TextStyle(color: Colors.white, fontFamily: "Viga"),
                            )
                          ]),
                      ),
                      const Spacer(),
                      Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.04),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(size.width, size.height * 0.07),
                                backgroundColor: Colors.white),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (selectedGender != null || _preferNotAnswer) {
                                  Navigator.pushNamed(
                                      context, AppRoutes.ageSelection);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please select a gender or prefer not to answer')),
                                  );
                                }
                              }
                            },
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                  color: Colors.black, fontFamily: "Viga"),
                            ),
                          )),
                    )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}