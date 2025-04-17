import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/domain/entities/number.dart';
import 'package:learn_with_me/presentation/blocs/number_bloc.dart';

class NumbersScreen extends StatefulWidget {
  const NumbersScreen({super.key});

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
            title: const Text('Numbers'),
          ),
          body: Builder(builder: (context) {
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
                  //leading: Image.asset(number.),
                  title: Text(number.number.toString()),
                );
              },
            );
          }),
        );
      },
    );
  }
}