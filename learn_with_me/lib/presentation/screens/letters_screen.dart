import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/core/constants/app_assets.dart';
import 'package:learn_with_me/domain/entities/letter.dart';
import 'package:learn_with_me/domain/usecases/get_letters.dart';
import 'package:learn_with_me/presentation/blocs/letter_bloc.dart';

class LettersScreen extends StatelessWidget {
  const LettersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LetterBloc(context.read<GetLetters>())
        ..add(GetLettersEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Letters Screen'),
          centerTitle: true,
        ),
        body: BlocBuilder<LetterBloc, LetterState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.errorMessage != null) {
              return Center(
                child: Text(state.errorMessage!),
              );
            }
            if (state.letters.isEmpty) {
              return const Center(
                child: Text("No letters available"),
              );
            }
            return _buildLetterList(state.letters);
          },
        ),
      ),
    );
  }

  Widget _buildLetterList(List<Letter> letters) {
    return ListView.builder(
      itemCount: letters.length,
      itemBuilder: (context, index) {
        final letter = letters[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              AppAssets.logoPath,
              width: 50,
              height: 50,
            ),
            title: Text(
              letter.letter,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}