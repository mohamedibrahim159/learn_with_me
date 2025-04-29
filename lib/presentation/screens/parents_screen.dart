import 'package:flutter/material.dart';
import 'package:learn_with_me/core/constants/app_colors.dart';
import 'package:get_it/get_it.dart';

class ParentsScreen extends StatelessWidget {
  const ParentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.instance;
    final String? savedChildName = getIt.get<String?>();
    final String? savedAge = getIt.get<String?>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("For Parents"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,color: AppColors.black,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Saved Data",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              if (savedChildName != null && savedAge != null) ...[
                Text("Child's Name: $savedChildName",style: const TextStyle(fontSize: 16),),
                Text("Selected Age: $savedAge",style: const TextStyle(fontSize: 16),),
              ] else
                const Text(
                  "No data saved",
                  style: TextStyle(fontSize: 16),
                ),
            ],
          ),)));
  }
}
