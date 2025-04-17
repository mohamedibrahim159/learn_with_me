import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_with_me/app/l10n/app_localizations.dart';
import 'package:learn_with_me/core/services/audio_service.dart';
import 'package:learn_with_me/domain/entities/animal.dart';
import 'package:learn_with_me/presentation/blocs/animal_bloc.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';

class AnimalsScreen extends StatelessWidget {
  final AudioService audioService;
  AnimalsScreen({super.key}) : audioService = GetIt.I.get<AudioService>();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimalBloc()..add(GetAnimalsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animals'),
          title: Text(AppLocalizations.of(context)!.animals),        ),
        body: BlocBuilder<AnimalBloc, AnimalState>(
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
                    return _buildAnimalItem(animal, context);
                  },
                ),
              ),
              tabletWidget: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemCount: animals.length,
                  itemBuilder: (context, index) {
                    final animal = animals[index];
                    return _buildAnimalItem(animal, context);
                  },
                ),
              ),
              desktopWidget: const Placeholder(),
            );
          },
        ),
      ),
    );
  }

  ListTile _buildAnimalItem(Animal animal) {
    return ListTile(
            leading: animal.image.isEmpty? null : Image.asset(
              animal.image,
              width: 50,
              height: 50,
            ),
            title: Text(animal.name),
          );
  }
}