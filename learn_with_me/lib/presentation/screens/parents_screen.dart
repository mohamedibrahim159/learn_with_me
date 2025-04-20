import 'package:flutter/material.dart';
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
            icon: const Icon(Icons.arrow_back,color: Colors.black,),
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
                Text("Child's Name: $savedChildName"),
                Text("Selected Age: $savedAge"),
              ] else
                const Text(
                  "No data saved",
                  style: TextStyle(fontSize: 16),
                ),
            ],
          ),
        ));
  }
}
    );
  }
}