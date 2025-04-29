import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_with_me/core/constants/app_assets.dart';
import 'package:learn_with_me/core/constants/app_colors.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ForLearnersScreen extends StatefulWidget {
  const ForLearnersScreen({super.key});

  @override
  State<ForLearnersScreen> createState() => _ForLearnersScreenState();
}

class _ForLearnersScreenState extends State<ForLearnersScreen> {
  String childName = "Learner 1";
  String? _selectedAge;
  final TextEditingController _nameController = TextEditingController();

  Map<String, String>? _savedData;

  bool _isDataChanged = false;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  void _loadSavedData() {
    final getIt = GetIt.instance;
    _savedData = getIt.get<Map<String, String>?>(instanceName: 'childData');
    childName = getIt.get<String?>(instanceName: 'savedChildName') ?? "Learner 1";
    _selectedAge = getIt.get<String?>(instanceName: 'childAge') ?? "Age 4-5";
    _isDataChanged = false;
    _isDataChanged = false;
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            child: const IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child:  ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.parents);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,

                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'For Parents',
              ),
            ),
          ),
          ResponsiveWidget(
            builder: (context, width) {
              return Center(
                child: Padding(
                  padding:const EdgeInsets.all(16.0),child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildChildImage(),
                      const SizedBox(height: 20),
                      _buildLearnerTrackActiveNow(),
                      const SizedBox(height: 20),
                      _buildChildNameArea(),
                      const SizedBox(height: 20),
                      _buildAgeSelectionArea(),
                      const SizedBox(height: 20),
                      const ElevatedButton(
                        onPressed: _isDataChanged ? _saveData : null,
                        child: const Text("Save"),
                      ),
                      if (_savedData == null)
                        const Text(
                          "No data saved",
                          style: TextStyle(fontSize: 16),
                        ),
                      if (_savedData != null) ...[
                        if (_savedData!['name'] != null && _savedData!['name']!.isNotEmpty)
                           Text("Child's Name: ${_savedData!['name']!}",style: const TextStyle(fontSize: 16),),
                        if (_savedData!['age'] != null && _savedData!['age']!.isNotEmpty)
                       Text("Selected Age: ${_savedData!['age']!}",style: const TextStyle(fontSize: 16),),
                      ],
                     ],
                  ),
                ),

              );

            },


          )
        ],
      ),
    
    );
  }

  void _saveData() async {
    final getIt = GetIt.instance;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? savedName = getIt.get<String?>(instanceName: 'savedChildName');
    String? savedAge = getIt.get<String?>(instanceName: 'childAge');

    bool nameChanged = savedName != childName;
    bool ageChanged = savedAge != _selectedAge;

    if (nameChanged || ageChanged) {
      setState(() {
        _savedData = {
          'name': childName,
          'age': _selectedAge!,
        };

        if (getIt.isRegistered<Map<String, String>>(instanceName: 'childData')) {
          getIt.unregister<Map<String, String>>(instanceName: 'childData');
        }
        getIt.registerSingleton<Map<String, String>>(_savedData!, instanceName: 'childData');

        prefs.setBool('isFirstTime', false);
        getIt.registerSingleton<String>(childName, instanceName: 'savedChildName');
        getIt.registerSingleton<String>(_selectedAge!, instanceName: 'childAge');
        _isDataChanged = false;
        Navigator.pushNamed(context, AppRoutes.home);
      });
    } else {
      setState(() {
        _isDataChanged = false;
        Navigator.pushNamed(context, AppRoutes.home);
      });
      }
  }
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  } 

 Widget _buildAgeSelectionArea() {
    final List<String> ageRanges = ["Age 4-5", "Age 6-7", "Age 7-8"]; 
     return  Wrap(
      spacing: 8,
      children: ageRanges.map((ageRange) {
       bool isSelected = _selectedAge == ageRange;
       return  GestureDetector(
          onTap: () {
            setState(() {
              if(_selectedAge != ageRange){
                 _isDataChanged = true;
              }
              _selectedAge = ageRange;
            });
           
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.secondaryColor : Colors.transparent,
                border: isSelected ? Border.all(color: AppColors.primaryColor):const Border(),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
               Text(
                  ageRange,
                  style: TextStyle(
                    color: isSelected ? Colors.white : AppColors.primaryColor,
                  ),
                ),
                if (isSelected)
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }


   void _showEditNameDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Child\'s Name"),
          content: TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: "Enter new name",
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text("Save"),
              onPressed: () {
                if (_nameController.text.isNotEmpty) {
                    _isDataChanged = true;
                    childName = _nameController.text;
                }
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

 
 Widget _buildChildImage() {
    return const CircleAvatar(
      radius: 60,
      backgroundImage: AssetImage(AppAssets.astronaut),
    );
  }

   Widget _buildLearnerTrackActiveNow() {
    return const Text(
      "Learner track active now",
      style: TextStyle(fontSize: 12, color: Colors.grey),
    );
  }

  Widget _buildChildNameArea() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              childName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        const  IconButton(
            icon: const Icon(Icons.edit, color: AppColors.primaryColor),
            onPressed: () {
              _nameController.text = childName;
              _showEditNameDialog();
            },
          ),
        ],
    );
  }
}