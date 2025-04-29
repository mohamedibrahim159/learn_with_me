import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/core/services/audio_service.dart';
import 'package:learn_with_me/presentation/blocs/number_bloc.dart';
import 'package:learn_with_me/presentation/blocs/number_event.dart';
import 'package:learn_with_me/presentation/blocs/number_state.dart';
import 'package:learn_with_me/domain/entities/number.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';

class NumbersScreen extends StatefulWidget {

  final AudioService audioService;
  final NumberBloc numberBloc;
  const NumbersScreen({super.key, required this.audioService, required this.numberBloc,
  });

  @override
  State<NumbersScreen> createState() => _NumbersScreenState();
}
 
class _NumbersScreenState extends State<NumbersScreen>{
  @override
  void initState() {
    super.initState();
    widget.numberBloc.add(const GetNumbersEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NumberBloc, NumberState>(
          bloc: widget.numberBloc,
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            else if (state.errorMessage.isNotEmpty) {
             return  Center(child: Text(state.errorMessage),);
            } else {
              
            
            return ResponsiveWidget(
              mobileWidget: _buildList(state.numbers),
              tabletWidget: _buildGrid(state.numbers, 2),
              desktopWidget: _buildGrid(state.numbers, 3),
            );
          },
        )
    ); }
    );
    Widget _buildList(List<Number> numbers) {
    return ListView.builder(
      itemCount: numbers.length,
      itemBuilder: (context, index) {
        final Number number = numbers[index];
        return ListTile(
          title:  Text(number.number.toString(),style: const TextStyle(fontSize: 20),),
          trailing: const IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () {
              widget.audioService.playAudio(number.audioPath);
            },
          ),
        );
      },
    );
  }
      Widget _buildGrid(List<Number> numbers, int crossAxisCount) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount),
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          final Number number = numbers[index];
          return Center(
              child: Column(
                children:  [
                  IconButton(
                      icon: const Icon(Icons.volume_up),
                      onPressed: () { widget.audioService.playAudio(number.audioPath); },),
                  Text(number.number.toString())
                ],
              ));
        });
  }
}
