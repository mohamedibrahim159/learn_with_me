import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/app/l10n/app_localizations.dart';
import 'package:learn_with_me/core/services/audio_service.dart';
import 'package:learn_with_me/domain/entities/number.dart';

import 'package:learn_with_me/presentation/blocs/number_bloc.dart';

import '../widgets/responsive_widget.dart';
class NumbersScreen extends StatefulWidget {
  final AudioService audioService;

  const NumbersScreen({
    super.key,
    required this.audioService,
  });

  @override
  State<NumbersScreen> createState() => _NumbersScreenState();
}


class _NumbersScreenState extends State<NumbersScreen> {
  @override
  void initState() {
    context.read<NumberBloc>().add(GetNumbersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NumberBloc, NumberState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            
          title: Text(AppLocalizations.of(context).numbers),),
          body: Builder(builder: (context) {
            return ResponsiveWidget(
              mobileWidget: Padding(
                padding: const EdgeInsets.all(10),
                child: Builder(builder: (context) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.errorMessage.isNotEmpty) {
                    return Center(child: Text(state.errorMessage));
                  }
                  final numbers = state.numbers;
                  return ListView.builder(
                    itemCount: numbers.length,
                    itemBuilder: (context, index) {
                      final Number number = numbers[index];
                      return ListTile(
                        title: Text(number.number.toString()),
                        trailing: IconButton(
                          icon: const Icon(Icons.volume_up),
                          onPressed: () {
                            widget.audioService
                                .playAudio(number.audioPath);
                          },
                        ),
                      );
                    },
                  );
                }),
              ),
              tabletWidget: Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                    itemCount: state.numbers.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final Number number = state.numbers[index];
                      return ListTile(
                        title: Center(
                          child: Text(
                            number.number.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                         trailing: IconButton(
                          icon: const Icon(Icons.volume_up),
                          onPressed: () {
                            widget.audioService.playAudio(number.audioPath);
                          },
                        ),
                      );
                    }),
              ),
              desktopWidget: const SizedBox(),
            );
              },
            );
          }),
        );
      },
    );
  }
}