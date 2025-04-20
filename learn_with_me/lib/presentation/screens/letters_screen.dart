import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/app/l10n/app_localizations.dart';
import 'package:learn_with_me/domain/entities/letter.dart';
import 'package:learn_with_me/presentation/blocs/letter_bloc.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';
import '../../../core/services/audio_service.dart';

class LettersScreen extends StatefulWidget {
  const LettersScreen({
    Key? key,
    required this.audioService,
    required this.letterBloc,
  }) : super(key: key);

  final AudioService audioService;
  final LetterBloc letterBloc;

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
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.letters),
      ),
      body: BlocBuilder<LetterBloc, LetterState>(
        bloc: widget.letterBloc,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.errorMessage.isNotEmpty) { 
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state.letters.isEmpty) {
          
              return const Center(child: Text("No Data"),);
          } else if (state.letters != null) {
            return ResponsiveWidget(
              mobileWidget: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _buildList(state.letters!)),
              tabletWidget: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _buildGrid(state.letters!, 2)),
              desktopWidget: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _buildGrid(state.letters!, 3)),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildList(List<Letter> letters) {
    return ListView.builder(
        itemCount: letters.length,
        itemBuilder: (context, index) {
         final Letter letter = letters[index];

          return ListTile(
            title: Text(letter.name),
            trailing: IconButton(
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

              child: IconButton(
                  icon: const Icon(Icons.volume_up),
                  onPressed: () {
                    widget.audioService.playAudio(letter.audioPath);
                  },
                  label: Text(letter.name)));
        });
  }
}