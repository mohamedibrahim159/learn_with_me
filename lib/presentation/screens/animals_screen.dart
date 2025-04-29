import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/core/services/audio_service.dart';
import 'package:learn_with_me/domain/entities/animal.dart';
import 'package:learn_with_me/presentation/blocs/animal_bloc.dart';
import 'package:learn_with_me/presentation/blocs/animal_event.dart';
import 'package:learn_with_me/presentation/blocs/animal_state.dart';
 
 
class AnimalsScreen extends StatefulWidget {
  final AnimalBloc animalBloc;
  final AudioService audioService;
  const AnimalsScreen({Key? key, required this.animalBloc, required this.audioService}) : super(key: key);
  
  @override
  State<AnimalsScreen> createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  @override
  void initState() {
    super.initState();
    widget.animalBloc.add(const GetAnimalsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AnimalBloc, AnimalState>(
          bloc: widget.animalBloc,
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.errorMessage.isNotEmpty) {
              return  Center(child: Text(state.errorMessage),);
            } else if (state.animals.isEmpty) {
              return const Center(child:  Text("No Data"));
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: state.animals.length,
                itemBuilder: (context, index) {
                  return _buildAnimalItem(state.animals[index]);
                },
              );
            }
          },
        ),      
    );
  }

  Widget _buildAnimalItem(Animal animal) {
    return  Card(
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const IconButton(
                icon: const Icon(Icons.volume_up),
                onPressed: () {
                  widget.audioService.playAudio(animal.sound);
                },
              ),const 
            ],
          ),
        ));
  }
}
