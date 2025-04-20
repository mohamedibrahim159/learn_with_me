import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_with_me/lib/core/constants/app_colors.dart';
import 'package:learn_with_me/lib/presentation/routes/app_routes.dart';
import 'package:learn_with_me/lib/core/constants/app_assets.dart';
import 'package:learn_with_me/lib/presentation/widgets/responsive_widget.dart';
import 'dart:math' as math;


class AgeSelectionScreen extends StatefulWidget {
  const AgeSelectionScreen({super.key});

  @override
  State<AgeSelectionScreen> createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {  
  String childName = "Learner 1"; 
  String? _selectedAge;
  final TextEditingController _nameController = TextEditingController();
  String? savedChildName, savedAge;
  bool _isDataChanged = false;

  @override
  void initState() {
    super.initState();
    final getIt = GetIt.instance;
    childName = getIt.get<String?>(instanceName: 'savedChildName') ?? "Learner 1";
    _selectedAge = getIt.get<String?>(instanceName: 'childAge') ?? "Age 4-5";
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: ElevatedButton(
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
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
                      ElevatedButton(
                        onPressed: _isDataChanged ? _saveData : null,
                        child: const Text("Save"),
                         ),
                    
                      
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

  void _saveData() {
     final getIt = GetIt.instance;
    if (_selectedAge != null) {
      setState(() {
        _isDataChanged = false;
          savedChildName = childName;
          savedAge = _selectedAge;

        if(getIt.isRegistered<String>(instanceName: 'savedChildName')){
          getIt.unregister<String>(instanceName: 'savedChildName');
        }
          getIt.registerSingleton<String>(savedChildName!, instanceName: 'savedChildName');
        if(getIt.isRegistered<String>(instanceName: 'savedAge')){
          getIt.unregister<String>(instanceName: 'savedAge');
        }
          getIt.registerSingleton<String>(savedAge!, instanceName: 'savedAge');
           _isDataChanged=false;
          Navigator.pushNamed(context, AppRoutes.home);// Close the dialog
        });
       
    }
      }


 Widget _buildAgeSelectionArea() {
    final List<String> ageRanges = ["Age 4-5", "Age 6-7", "Age 7-8"];


    return Wrap(
      spacing: 10,
      children: ageRanges.map((ageRange) {
        bool isSelected = _selectedAge == ageRange;
        return GestureDetector(
          onTap: () {
           setState(() {
              if(_selectedAge != ageRange){
                 _isDataChanged = true;
              }
              _selectedAge = ageRange;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.secondaryColor : Colors.transparent,
              border: Border.all(color: AppColors.primaryColor),
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
                setState(() {
                  if (_nameController.text.isNotEmpty) {
                    setState(() {
                        _isDataChanged = true;
                      });
                    childName = _nameController.text;
                  }
                });
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

 Widget _buildChildNameArea() {
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
          IconButton(
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