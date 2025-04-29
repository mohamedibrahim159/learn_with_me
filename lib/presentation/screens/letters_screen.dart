import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/domain/entities/letter.dart';
import 'package:learn_with_me/core/services/audio_service.dart';
import 'package:learn_with_me/presentation/blocs/letter_bloc.dart';
import 'package:learn_with_me/presentation/blocs/letter_event.dart';
import 'package:learn_with_me/presentation/blocs/letter_state.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';

class LettersScreen extends StatefulWidget {
  final LetterBloc letterBloc;
  final AudioService audioService;
  const LettersScreen({Key? key, required this.letterBloc, required this.audioService}) : super(key: key);


  @override
  State<LettersScreen> createState() => _LettersScreenState();
}

class _LettersScreenState extends State<LettersScreen> {
   @override
  void initState() {
    super.initState();
    widget.letterBloc.add(const GetLettersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LetterBloc, LetterState>(
        bloc: widget.letterBloc,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.errorMessage.isNotEmpty) {
            return  Center(
              child: Text(state.errorMessage),
            );
          }
          else {
            return ResponsiveWidget(
              mobileWidget: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _buildList(state.letters)),
              tabletWidget: Padding(
                   padding: const EdgeInsets.all(20.0),
                  child: _buildGrid(state.letters, 2)),
              desktopWidget: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _buildGrid(state.letters, 3)),
            );
          }
        }),
      );
  }

  Widget _buildList(List<Letter> letters) {
    return ListView.builder(
        itemCount: letters.length,
        itemBuilder: (context, index) {
         final Letter letter = letters[index];

          return  ListTile(
            title:  Text(letter.letter,style: const TextStyle(fontSize: 20),),
            trailing:  IconButton(
               icon: const Icon(Icons.volume_up),
                onPressed: () {
                widget.audioService.playAudio(letter.audioPath);
              },
            ),
          );
        },
      );
  }
  Widget _buildGrid(List<Letter> letters, int crossAxisCount) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount),
        itemCount: letters.length,
        itemBuilder: (context, index) {
          final Letter letter = letters[index];
          return Center(
              child: Column(
                children: [
                  IconButton(
                      icon: const Icon(Icons.volume_up),
                      onPressed: () {
                        widget.audioService.playAudio(letter.audioPath);
                      }),
                     Text(letter.letter)],
              ));
        });
  }
}