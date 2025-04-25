import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_with_me/app/l10n/app_localizations.dart';
import 'package:learn_with_me/core/services/audio_service.dart';
import 'package:learn_with_me/domain/entities/animal.dart';
import 'package:learn_with_me/presentation/blocs/animal_bloc.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';

class AnimalsScreen extends StatefulWidget {
   AnimalsScreen({super.key});



  @override
  State<AnimalsScreen> createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
     late final AnimalBloc bloc;
      late final AudioService audioService;
  @override
  void initState() {
          audioService = GetIt.I.get<AudioService>();
    bloc = GetIt.I.get<AnimalBloc>();
    bloc.add(GetAnimalsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.animals),
      ),
      body: BlocBuilder<AnimalBloc, AnimalState>(
        bloc: bloc,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.errorMessage.isNotEmpty) {
            return Center(child: Text(state.errorMessage));
          }
          final animals = state.animals;
          return ResponsiveWidget(
            mobileWidget: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: animals.length,
                 itemBuilder: (context, index) {
                  final animal = animals[index];
                  return _buildAnimalItem(animal);
                },
             
              
              
              ),
            ),
            tabletWidget: const Placeholder(),
            desktopWidget: const Placeholder(),
          );
        },
      ),
      
              tabletWidget: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: animals.length,
                itemBuilder: (context, index) {final animal = animals[index];
                  return _buildAnimalItem(animal);},
              ),
            ),
            desktopWidget: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,),
                itemCount: animals.length,
                itemBuilder: (context, index) {final animal = animals[index];
                  return _buildAnimalItem(animal);},
              ),),
       
    );
  }

  ListTile _buildAnimalItem(Animal animal){
    return ListTile(
            leading: animal.image.isEmpty? null : Image.asset(animal.image,width: 50,height: 50,),
            title: Text(animal.name),
             trailing: IconButton(icon: const Icon(Icons.volume_up),
                onPressed: () {audioService.playAudio(animal.audioPath);},),
          );
  }
}
